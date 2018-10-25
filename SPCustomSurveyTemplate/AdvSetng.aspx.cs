using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using System;
using System.Web;

namespace Xnet.SP.Kolektor.Layouts.Xnet.SP.Kolektor
{
    public partial class advsetng : Microsoft.SharePoint.ApplicationPages.AdvancedSettingsPage
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

        private bool CheckIfListHasUniqueFields(SPList list)
        {
            bool result = false;
            for (int i = 0; i < list.Fields.Count; i++)
            {
                try
                {
                    SPField sPField = list.Fields[i];
                    if (sPField.EnforceUniqueValues)
                    {
                        result = true;
                        return result;
                    }
                }
                catch (SPException) {}
            }
            return result;
        }

        protected new void BtnSaveAdvancedSettings_Click(object sender, EventArgs e)
        {
            bool flag = false;
            if (base.List.AllowContentTypes)
            {
                base.List.ContentTypesEnabled = RadEnableContentTypesYes.Checked;
            }
            if (ItemLevelSecurityPanel.Visible)
            {
                int num = 1;
                if (RadReadSecurityOwn.Checked)
                {
                    num = 2;
                }
                if (num == 2 && CheckIfListHasUniqueFields(base.List))
                {
                    throw new SPException(base.GetResourceString("advsetng_CannotSetItemLevelPermissionsOnListWithUniqueColumns"));
                }
                int writeSecurity = 1;
                if (RadWriteSecurityOwn.Checked)
                {
                    writeSecurity = 2;
                }
                else if (RadWriteSecurityNone.Checked)
                {
                    writeSecurity = 4;
                }
                base.List.ReadSecurity = num;
                base.List.WriteSecurity = writeSecurity;
            }
            //SendToSection.UseFieldset = true;
            if (SendToSection.Visible)
            {
                base.List.SendToLocationName = TxtSendToLocationName.Text;
                base.List.SendToLocationUrl = TxtSendToLocationUrl.Text;
            }
            if (TasksIssuesEmailSettingsSection.Visible)
            {
                base.List.EnableAssignToEmail = RadEnableAssigntoEmailYes.Checked;
            }
            if (RadDefaultItemOpenPreferClient.Checked)
            {
                base.List.DefaultItemOpen = DefaultItemOpen.PreferClient;
            }
            else if (RadDefaultItemOpenBrowser.Checked)
            {
                base.List.DefaultItemOpen = DefaultItemOpen.Browser;
            }
            else if (RadDefaultItemOpenServerSetting.Checked)
            {
                base.List.DefaultItemOpen = DefaultItemOpen.PreferClient;
                base.List.DefaultItemOpenUseListSetting = false;
            }
            if (FolderCreationSection.Visible)
            {
                base.List.EnableFolderCreation = RadEnableFoldersYes.Checked;
            }
            if (AllowCrawlSection.Visible)
            {
                base.List.NoCrawl = !RadAllowCrawlYes.Checked;
            }
            if (SPUtility.IsCompatibilityLevel15Up && AllowNonDefaultCrawlViewSection.Visible)
            {
                base.List.CrawlNonDefaultViews = RadAllowNonDefaultCrawlViewYes.Checked;
            }
            //if (AllowSyncSection.Visible && !base.Web.SiteSubscriptionSettingsCache.ExcludeOfflineClient && RadAllowSyncYes.Enabled)
            //{
            //    base.List.ExcludeFromOfflineClient = !RadAllowSyncYes.Checked;
            //}
            if (AllowGridEditingSection.Visible)
            {
                base.List.DisableGridEditing = !RadAllowGridYes.Checked;
            }
            if (DocumentTemplateSection.Visible)
            {
                SPDocumentLibrary sPDocumentLibrary = (SPDocumentLibrary)base.List;
                sPDocumentLibrary.DocumentTemplateUrl = TxtListDocumentTemplate.Text;
            }
            if (PanelAttachments.Visible)
            {
                bool enableAttachments = base.List.EnableAttachments;
                base.List.EnableAttachments = RadAttachmentsEnabled.Checked;
                if (!enableAttachments && RadAttachmentsEnabled.Checked)
                {
                    flag = ChkAttachmentsAddToDefaultView.Checked;
                }
            }
            if (PanelGlobalMettingsDataList.Visible)
            {
                base.List.MultipleDataList = !RadGlobalMtgDataListYes.Checked;
            }
            if (AttachmentLibrarySection.Visible)
            {
                base.List.IsSiteAssetsLibrary = RadAttachmentLibraryYes.Checked;
            }
            if (DialogForFormsPagesSection.Visible)
            {
                base.List.NavigateForFormsPages = RadDialogForFormsPagesNo.Checked;
            }
            if (SPUtility.IsCompatibilityLevel15Up && ManagedIndexesSection.Visible)
            {
                base.List.EnableManagedIndexes = RadManagedIndexesYes.Checked;
            }
            if (EventHandlerSection.Visible && base.Web.EventHandlersEnabled)
            {
                base.List.EventSinkAssembly = TxtEventHandlerAssemblyName.Text.Trim();
                base.List.EventSinkClass = TxtEventHandlerClassName.Text.Trim();
                base.List.EventSinkData = TxtEventHandlerProperties.Text.Trim();
            }
            base.List.Update();
            if (flag)
            {
                SPView defaultView = base.List.DefaultView;
                SPViewFieldCollection viewFields = defaultView.ViewFields;
                if (!viewFields.Exists("Attachments"))
                {
                    viewFields.Add("Attachments");
                    defaultView.Update();
                }
            }

            SPUtility.Redirect(base.List.DefaultViewUrl, SPRedirectFlags.UseSource | SPRedirectFlags.Trusted, HttpContext.Current);
        }
    }
}
