using Microsoft.SharePoint.Utilities;
using System;
using System.Web;

namespace Xnet.SP.Kolektor.Layouts.Xnet.SP.Kolektor
{
    public partial class ListGeneralSettings : Microsoft.SharePoint.ApplicationPages.ListGeneralSettingsPage
    {
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
        }

        protected new void BtnSave_Click(object sender, EventArgs e)
        {
            base.List.Title = TxtListTitle.Text;
            base.List.Description = TxtListDescription.Text;
            if (NavigationSection.Visible)
            {
                base.List.OnQuickLaunch = RadDisplayOnLeftYes.Checked;
            }
            if (DirectionSection.Visible)
            {
                base.List.Direction = DdlDirection.SelectedValue;
            }
            if (SurveySection.Visible)
            {
                base.List.ShowUser = RadShowUserYes.Checked;
                base.List.AllowMultiResponses = RadAllowMultiResponseYes.Checked;
            }
            
            base.List.Update();

            SPUtility.Redirect(base.List.DefaultViewUrl, SPRedirectFlags.UseSource | SPRedirectFlags.Trusted, HttpContext.Current);
        }
    }
}
