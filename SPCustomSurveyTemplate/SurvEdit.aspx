<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%> <%@ Page Language="C#" DynamicMasterPageFile="~masterurl/default.master" Inherits="Microsoft.SharePoint.ApplicationPages.ListEditPage"   EnableViewState="false"    %> <%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="wssuc" TagName="LinkSection" src="~/_controltemplates/15/LinkSection.ascx" %>
<%@ Register Tagprefix="Meetings" Namespace="Microsoft.SharePoint.Meetings" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Workflow" Namespace="Microsoft.SharePoint.Workflow" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Import Namespace="Microsoft.SharePoint.Utilities" %>
<%@ Import Namespace="System.Collections.Generic" %>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<SharePoint:FormattedStringWithListType runat="server" String="<%$Resources:wss,listedit_pagetitle_wildcard%>" LowerCase="false" />
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderAdditionalPageHead" runat="server">
<style type="text/css">
.ms-listedit-sectiondescription {
	padding: 2px 4px 8px
}
</style>
<SharePoint:ScriptBlock runat="server">
(function () {
	$(document).ready(function () {
		HideGenSettingsElementsNoCondition("LnkValidationSettings", "EnableAudienceTargeting", "EnableListRatingsLink", "IPFSSettingsListEditPage", "onetidListEdit9", "FilePlanReport", "ListMetadataColSettings", "ListPolicySettings", "MetaNavSettings", "MetaNavPerNodeSettings");
	
		var permEl = $(".ms-listeditnav td.ms-propertysheet a[id$=LnkGeneralSettings]");
		permEl.attr("href", permEl.attr("href") + "&source=<%SPHttpUtility.WriteUrlKeyValueEncode(SPUtility.GetFullUrl(SPContext.Current.Site, SPUtility.OriginalServerRelativeRequestUrl), this);%>");

		permEl = $(".ms-listeditnav td.ms-propertysheet a[id$=onetidListEdit10]");
		permEl.attr("href", permEl.attr("href") + "&source=<%SPHttpUtility.WriteUrlKeyValueEncode(SPUtility.GetFullUrl(SPContext.Current.Site, SPUtility.OriginalServerRelativeRequestUrl), this);%>");

		permEl = $(".ms-listeditnav td.ms-propertysheet a[id$=onetidListEdit7]");
		permEl.attr("href", "../../../" + permEl.attr("href"));
	});

	function HideGenSettingsElementsNoCondition() {
        var paramItems = arguments;

        for (var i = 0; i < paramItems.length; i++) {
            $(".ms-listeditnav td.ms-propertysheet a[id$=" + paramItems[i] + "]").closest('tr').remove();
        }
    }
})();

var navBarHelpOverrideKey = "WSSEndUser_ListChangeSettings";
var _spUseDefaultFocus = true;
function _spBodyOnLoad()
{
	<%
	if (IsUpLevelBrowser && bShowThrottleMeter)
	{
	%>
	var cItemsThrottleLimit = <% SPHttpUtility.WriteNoEncode(spWssWebApp.MaxItemsPerThrottledOperation,this.Page); %>;
	var cItems = <% SPHttpUtility.WriteNoEncode(spList.ItemCount,this.Page); %>;
	var tblThrottle = document.getElementById("tblThrottle");
	var row = tblThrottle.rows[0];
	row.height = 20;
	var pctUsed = Math.min(100, (cItems*100)/cItemsThrottleLimit);
	var cellMeterText = document.getElementById("tdMeterText");
	if (cItems <= cItemsThrottleLimit)
		cellMeterText.innerHTML = <% SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(String.Format( System.Globalization.CultureInfo.InvariantCulture, GetResourceString("listedit_ThrottleWarning"), spWssWebApp.MaxItemsPerThrottledOperation)),this.Page); %>;
	else
		cellMeterText.innerHTML = <% SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(String.Format( System.Globalization.CultureInfo.InvariantCulture, GetResourceString("listedit_ThrottleLimitExceeded"), spWssWebApp.MaxItemsPerThrottledOperation)),this.Page); %>;
	if (cItems > 0)
	{
		var cell = document.getElementById("tdUsed");
		cell.innerHTML = <% SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(spList.ItemCount == 1 ? GetResourceString("listedit_ThrottleItem") : String.Format( System.Globalization.CultureInfo.InvariantCulture, GetResourceString("listedit_ThrottleItems"), spList.ItemCount, spWssWebApp.MaxItemsPerThrottledOperation)),this.Page); %>;
		cell.width = (pctUsed < 1) ? "1%" : pctUsed + '%';
	}
	else
		row.deleteCell(0);
	if (pctUsed >= 100)
		row.deleteCell(1);
	<%
	}
	%>
}
</SharePoint:ScriptBlock>
<script runat="server">
	String strType = "";
	String strTypeSaveAsTempDesc = "";
	String strTypeSaveAsTempText2 = "";
	String strListType = "";
	String strDelWarn = "";
	String L_strType_Text = "";
	String L_strTypeSaveAsTmplDesc_Text = "";
	String L_strTypeSaveAsTmplText2_Text = "";
	String L_strListType_Text = "";
	String L_strDelWarn_Text = "";
</script>
<%
	switch (iBaseType)
		{
	case SPBaseType.DocumentLibrary:
		if (SPListTemplateType.PictureLibrary == iServerTemplate)
		{
			L_strType_Text = (string)GetGlobalResourceObject("wss", "liststr_picturelibrary_type");
			L_strTypeSaveAsTmplDesc_Text = (string)GetGlobalResourceObject("wss", "liststr_picturelibrary_saveastmpldesc");
			L_strTypeSaveAsTmplText2_Text = (string)GetGlobalResourceObject("wss", "liststr_picturelibrary_SaveAsTmplText2");
			L_strListType_Text = (string)GetGlobalResourceObject("wss", "liststr_picturelibrary_ListType");
			L_strDelWarn_Text = (string)GetGlobalResourceObject("wss", "liststr_picturelibrary_DelWarn");
		}
		else if (SPListTemplateType.XMLForm == iServerTemplate)
		{
			L_strType_Text = (string)GetGlobalResourceObject("wss", "liststr_formlibrary_Type");
			L_strTypeSaveAsTmplDesc_Text = (string)GetGlobalResourceObject("wss", "liststr_formlibrary_SaveAsTmplDesc");
			L_strTypeSaveAsTmplText2_Text = (string)GetGlobalResourceObject("wss", "liststr_formlibrary_SaveAsTmplText2");
			L_strListType_Text = (string)GetGlobalResourceObject("wss", "liststr_formlibrary_ListType");
			L_strDelWarn_Text = (string)GetGlobalResourceObject("wss", "liststr_formlibrary_DelWarn");
		}
		else if (SPListTemplateType.DataConnectionLibrary == iServerTemplate)
		{
			L_strType_Text = (string)GetGlobalResourceObject("wss", "liststr_dataconnectionlibrary_Type");
			L_strTypeSaveAsTmplDesc_Text = (string)GetGlobalResourceObject("wss", "liststr_dataconnectionlibrary_SaveAsTmplDesc");
			L_strTypeSaveAsTmplText2_Text = (string)GetGlobalResourceObject("wss", "liststr_dataconnectionlibrary_SaveAsTmplText2");
			L_strListType_Text = (string)GetGlobalResourceObject("wss", "liststr_dataconnectionlibrary_ListType");
			L_strDelWarn_Text = (string)GetGlobalResourceObject("wss", "liststr_dataconnectionlibrary_DelWarn");
		}
		else if (SPListTemplateType.ListTemplateCatalog == iServerTemplate ||
				 SPListTemplateType.WebTemplateCatalog == iServerTemplate ||
				 SPListTemplateType.WebPartCatalog == iServerTemplate)
		{
			L_strType_Text = (string)GetGlobalResourceObject("wss", "liststr_gallery_Type");
			L_strTypeSaveAsTmplDesc_Text = (string)GetGlobalResourceObject("wss", "liststr_gallery_SaveAsTmplDesc");
			L_strTypeSaveAsTmplText2_Text = (string)GetGlobalResourceObject("wss", "liststr_gallery_SaveAsTmplText2");
			L_strListType_Text = (string)GetGlobalResourceObject("wss", "liststr_gallery_ListType");
			L_strDelWarn_Text = (string)GetGlobalResourceObject("wss", "liststr_gallery_DelWarn");
		}
		else
		{
			L_strType_Text = (string)GetGlobalResourceObject("wss", "liststr_doclib_Type");
			L_strTypeSaveAsTmplDesc_Text = (string)GetGlobalResourceObject("wss", "liststr_doclib_SaveAsTmplDesc");
			L_strTypeSaveAsTmplText2_Text = (string)GetGlobalResourceObject("wss", "liststr_doclib_SaveAsTmplText2");
			L_strListType_Text = (string)GetGlobalResourceObject("wss", "liststr_doclib_ListType");
			L_strDelWarn_Text = (string)GetGlobalResourceObject("wss", "liststr_doclib_DelWarn");
		}
		break;
	case SPBaseType.DiscussionBoard:
		L_strType_Text = (string)GetGlobalResourceObject("wss", "liststr_disc_Type");
		L_strTypeSaveAsTmplDesc_Text = (string)GetGlobalResourceObject("wss", "liststr_disc_SaveAsTmplDesc");
		L_strTypeSaveAsTmplText2_Text = (string)GetGlobalResourceObject("wss", "liststr_disc_SaveAsTmplText2");
		L_strListType_Text = (string)GetGlobalResourceObject("wss", "liststr_disc_ListType");
		L_strDelWarn_Text ="";
		break;
	case SPBaseType.Survey:
		L_strType_Text = (string)GetGlobalResourceObject("wss", "liststr_survey_Type");
		L_strTypeSaveAsTmplDesc_Text = (string)GetGlobalResourceObject("wss", "liststr_survey_SaveAsTmplDesc");
		L_strTypeSaveAsTmplText2_Text = (string)GetGlobalResourceObject("wss", "liststr_survey_SaveAsTmplText2");
		L_strListType_Text = (string)GetGlobalResourceObject("wss", "liststr_survey_ListType");
		L_strDelWarn_Text = "";
		break;
	default:
		L_strType_Text = (string)GetGlobalResourceObject("wss", "liststr_list_Type");
		L_strTypeSaveAsTmplDesc_Text = (string)GetGlobalResourceObject("wss", "liststr_list_SaveAsTmplDesc");
		L_strTypeSaveAsTmplText2_Text = (string)GetGlobalResourceObject("wss", "liststr_list_SaveAsTmplText2");
		L_strListType_Text = (string)GetGlobalResourceObject("wss", "liststr_list_ListType");
		L_strDelWarn_Text = "";
		break;
	}
	strType = L_strType_Text ;
	strTypeSaveAsTempDesc = L_strTypeSaveAsTmplDesc_Text;
	strTypeSaveAsTempText2 = L_strTypeSaveAsTmplText2_Text;
	strListType = L_strListType_Text ;
	strDelWarn = L_strDelWarn_Text ;
%>
<SharePoint:ScriptBlock runat="server">
var strText0 = <%SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(strDelWarn),this.Page);%>;
var strText1 = <%SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(strListType),this.Page);%>;
var bHasRelatedLists = false;
var allRelatedListsDeleteWarning = "";
<%
	string strRelatedLists = GetRelatedLists();
	if (strRelatedLists.Length > 0) { %>
allRelatedListsDeleteWarning = <%SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(strRelatedLists),this.Page);%>;
bHasRelatedLists = true;
<% } %>
var L_Confirm_text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,listedit_L_Confirm_text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
var L_ConfirmRecycle_text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,listedit_L_ConfirmRecycle_text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
var L_RIDeleteAlert_text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,listedit_L_RIDeleteAlert_text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
var L_RIRecycleAlert_text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,listedit_L_RIRecycleAlert_text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
function DeleteList() {
	if (typeof(Custom_DeleteList) != "undefined")
	{
		if (Custom_DeleteList())
			return;
	}
	<%
	if (!spWssWebApp.RecycleBinEnabled)
	{
%>
var strAlert = StBuildParam(L_RIDeleteAlert_text, strText1) + allRelatedListsDeleteWarning;
var strConfirm = strText0 + StBuildParam(L_Confirm_text, strText1);
<%
	}
	else
	{
%>
var strAlert = StBuildParam(L_RIRecycleAlert_text, strText1) + allRelatedListsDeleteWarning;
var strConfirm = strText0 + StBuildParam(L_ConfirmRecycle_text, strText1);
<%
	}
%>
	if (bHasRelatedLists)
	{
		alert(strAlert);
	}
	else
	{
		if (confirm(strConfirm))
		{
			<%= Page.GetPostBackEventReference(Page, "Delete") %>;
		}
	}
}
</SharePoint:ScriptBlock>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageImage" runat="server">
	<img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageDescription" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
 <table cellspacing="0" cellpadding="0" border="0" style="width:100%;height: 100%" class="ms-settingsframe ms-listedit" dir="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,multipages_direction_dir_value%>' EncodeMethod='HtmlEncode'/>">
  <tr>
   <td width="100%" colspan="4" style="padding-top: 0px;">
	<table class="ms-pageinformation" width="100%" cellpadding="0" cellspacing="0">
	 <tr>
	  <td valign="top" class="ms-listeditheader" width="100%" height="100px">
	   <table width="100%" id="idItemHoverTable">
		<tr>
			<th scope="col" colspan="2" style="padding-bottom: 4px;"  valign="top" class="ms-listedit-listinfo"><h3 class="ms-standardheader"><span class="ms-linksectionheader"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_listinformation%>" EncodeMethod='HtmlEncode'/></span></h3></th>
		</tr>
		<tr>
			<th scope="row" nowrap="nowrap" valign="top"  id="500"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_title%>" EncodeMethod='HtmlEncode'/></th>
			<td valign="top"><%SPHttpUtility.WriteHtmlEncode(spList.Title,this.Page); %></td>
		</tr>
		<tr>
			<th scope="row" nowrap="nowrap" valign="top"  id="600"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_webaddr%>" EncodeMethod='HtmlEncode'/></th>
			<td dir="ltr" nowrap="nowrap" valign="top">
				<%SPHttpUtility.WriteHtmlEncode(Site.MakeFullUrl(strDefaultViewUrl),this.Page);%>
			</td>
		</tr>
		<tr>
			<th scope="row" valign="top"  id="701"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,multipages_description%>" EncodeMethod='HtmlEncode'/></th>
			<%
				string listDescription;
				listDescription = ListPageBase.RenderListDescription(Web, spList);
			%>
			<td valign="top" height="13px"><%SPHttpUtility.WriteNoEncode(listDescription,this.Page); %>
			</td>
		</tr>
		<%
		if (spList.HasExternalDataSource)
		{
		%>
		<tr>
			<th scope="row" valign="top"  id="702"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,multipages_data%>" EncodeMethod='HtmlEncode'/></th>
			<td valign="top"><%SPHttpUtility.WriteHtmlEncodeAllowSimpleTextFormatting(spList.DataSource.GetProperty(Microsoft.SharePoint.SPListDataSource.BDCProperties.Entity),this.Page); %>
			</td>
		</tr>
		<%
		}
		if (bEmailServiceEnabled &&
			!String.IsNullOrEmpty(spList.EmailAlias))
		{
			%>
			<tr>
				<th scope="row" valign="top"  id="701"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_emailalias%>" EncodeMethod='HtmlEncode'/></th>
				<td valign="top"><%SPHttpUtility.WriteHtmlEncode(spList.EmailAlias + "@" + strEmailSuffix,this.Page); %>
				</td>
			</tr>
			<%
		}
		%>
		<%
		if (IsUpLevelBrowser && bShowThrottleMeter)
		{
		%>
		<tr>
			<th scope="row" valign="top"  id="701"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_ThrottlingStatus%>" EncodeMethod='HtmlEncode'/></th>
			<td valign="top">
			  <table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
				  <td style="line-height:25px">
					<table id="tblThrottle" align="left" width="50%" cellpadding="0" cellspacing="0">
					  <tr id="row">
						 <td id="tdUsed" class="ms-storMeUsed" style="text-align:center" />
						 <td id="tdFree" class="ms-storMeFree" style="text-align:center">&#160;</td>
					  </tr>
					</table>
				  </td>
				</tr>
				<tr>
				   <td id="tdMeterText" />
				</tr>
				<tr>
				   <td id="tdMeterTextHelp" display="none">
				   <a href=javascript:HelpWindowKey("WSSEndUser_LargeList")><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_largelist_help%>" EncodeMethod='HtmlEncode'/></a>
				   </td>
				</tr>
			  </table>
			</td>
		</tr>
		<%
		}
		%>
	   </table>
	  </td>
	 </tr>
	</table>
   </td>
  </tr>
  <tr>
   <td colspan="3" width="100%" id="_spFocusHere" class="ms-listeditnav">
	<table width="100%" cellpadding="1" cellspacing="2" border="0">
	 <tr>
	  <td valign="top" width="34%">
	   <table width="100%" cellpadding="0" cellspacing="0" border="0">
		<wssuc:LinkSection
			Title="<%$Resources:wss, listedit_generalset%>"
			runat="server">
			<Template_Description>
			</Template_Description>
			 <Template_Links>
			  <asp:HyperLink NavigateUrl="ListGeneralSettings.aspx" ID="LnkGeneralSettings" runat="server" />
			  <asp:HyperLink NavigateUrl="LstSetng.aspx" ID="onetidListEdit1" runat="server" text="<%$SPHtmlEncodedResources:wss,listedit_versioningandapproval%>" />
			  <asp:HyperLink NavigateUrl="advsetng.aspx" ID="onetidListEdit10" runat="server" text="<%$SPHtmlEncodedResources:wss,listedit_idChangeAdvanced%>" />
			  <asp:HyperLink NavigateUrl="VldSetng.aspx" ID="LnkValidationSettings" runat="server" text="<%$SPHtmlEncodedResources:wss,listedit_changevalidation%>" />
			</Template_Links>
			<Template_OtherControls>
				<SharePoint:FeatureLinks
					ID="DocumentLibraryGeneralLinks"
					Visible="False"
					Location="Microsoft.SharePoint.ListEdit.DocumentLibrary"
					GroupId="GeneralSettings"
					runat="server" />
				<SharePoint:FeatureLinks
					ID="GeneralLinks"
					Visible="True"
					Location="Microsoft.SharePoint.ListEdit"
					GroupId="GeneralSettings"
					runat="server" />
			</Template_OtherControls>
		</wssuc:LinkSection>
	   </table>
	  <td></td>
	  </td>
	  <td valign="top" width="33%">
	   <table width="100%" cellpadding="0" cellspacing="0" border="0">
		<wssuc:LinkSection
			Title="<%$Resources:wss,listedit_permissions%>"
			runat="server">
			<Template_Description>
			</Template_Description>
			 <Template_Links>
			  <asp:HyperLink ID="onetidListEdit2" runat="server" Visible="False" />
			  <asp:HyperLink NavigateUrl="savetmpl.aspx" ID="onetidListEdit9" runat="server" Visible="False" />
			  <asp:HyperLink NavigateUrl="user.aspx" ID="onetidListEdit7" runat="server" Visible="False" />
			  <asp:HyperLink ID="onetidManageCheckedOutFiles" runat="server" text="<%$SPHtmlEncodedResources:wss,listedit_managecheckedoutfiles%>" Visible="false" />
			  <asp:HyperLink NavigateUrl="irm.aspx" ID="onetidListEdit7i" runat="server" text="<%$SPHtmlEncodedResources:wss,listedit_changeirm%>" Visible="False" />
			  <asp:HyperLink ID="onetidListEditRelink" runat="server" text="<%$SPHtmlEncodedResources:wss,listedit_relinkforms%>" Visible="False" />
			  <asp:HyperLink NavigateUrl="WrkSetng.aspx" ID="onetidListEdit11" runat="server" text="<%$SPHtmlEncodedResources:wss,listedit_changeworkflowsettings%>" Visible="False" />
			  </Template_Links>
			<Template_OtherControls>
				<SharePoint:FeatureLinks
					Location="Microsoft.SharePoint.ListEdit"
					GroupId="Permissions"
					runat="server" />
			</Template_OtherControls>
		</wssuc:LinkSection>
	   </table>
	  </td>
	  <td></td>
	  <td valign="top" width="33%">
	   <table width="100%" cellpadding="0" cellspacing="0" border="0">
		<wssuc:LinkSection
			ID="LnksecCommunications"
			Title="<%$Resources:wss, listedit_communications%>"
			runat="server">
			<Template_Description>
			</Template_Description>
			<Template_Links>
				<asp:HyperLink NavigateUrl="EmailSettings.aspx" ID="onetidListEdit10e" runat="server" text="<%$SPHtmlEncodedResources:wss,listedit_emailsettings%>" Visible="False" />
				<asp:HyperLink NavigateUrl="listsyndication.aspx" ID="onetidRssSettings" runat="server" text="<%$SPHtmlEncodedResources:wss,listedit_changersssettings%>" Visible="False" />
			</Template_Links>
			<Template_OtherControls>
				<SharePoint:FeatureLinks
					Location="Microsoft.SharePoint.ListEdit"
					GroupId="Communications"
					runat="server" />
			</Template_OtherControls>
		</wssuc:LinkSection>
	   </table>
	  </td>
	 </tr>
	</table>
   </td>
  </tr>
<%
if (spList.ContentTypesEnabled)
{
%>
		<!--Content Types Header-->
	  <tr><td width="100%"><table width="100%" cellpadding="0" cellspacing="3">
	  <tr height="10"><td colspan="4" class="ms-linksectionheader" style="padding: 4px;" id="1400"><h3 class="ms-standardheader"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_contenttypes%>" EncodeMethod='HtmlEncode'/></h3></td></tr>
						<tr>
								<td valign="top" colspan="4" class="ms-descriptiontext ms-listedit-sectiondescription"  id="1500">
						<% if (IsDocumentLibrary) { %>
							<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_contenttypes_description_dl%>" EncodeMethod='HtmlEncode'/>
						<% } else { %>
							<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_contenttypes_description%>" EncodeMethod='HtmlEncode'/>
						<% } %>
								</td>
						</tr>
<tr><td colspan="4" class="ms-gb"><table width="100%" border="0" cellspacing="0" cellpadding="0" summary=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(spList.Title),this.Page); %> >
						<tr>
								<th scope="col"  class="ms-vh2-nofilter" id="HeaderContentTypeName"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_contenttypename%>" EncodeMethod='HtmlEncode'/></th>
								<th scope="col"  class="ms-vh2-nofilter" id="HeaderAllowedForNewItems"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_allowedfornewitems%>" EncodeMethod='HtmlEncode'/></th>
								<th scope="col"  class="ms-vh2-nofilter" colspan="2" id="HeaderDefaultContentType"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_defaultcontenttype%>" EncodeMethod='HtmlEncode'/></th>
						</tr>
<%
	rowClass = "ms-alternating";
	int idxCt = 0;
	IList<SPContentType> ctoFolder = spList.RootFolder.UniqueContentTypeOrder;
	foreach (SPContentType contentType in ContentTypeOrder)
	{
		rowClass = (rowClass == "")? "ms-alternating" : "";
		bool fAllowedCt = false;
		if (ctoFolder == null)
		{
			fAllowedCt = !contentType.Id.IsChildOf(SPBuiltInContentTypeId.UntypedDocument);
		}
		else
		{
			foreach (SPContentType ct2 in ctoFolder)
			{
				if (ct2.Id == contentType.Id)
				{
					fAllowedCt = true;
					break;
				}
			}
		}
%>
				  <tr class="<%=rowClass%>">
					<td class="ms-vb2">
					<a id="LinkManageContentType<%= Convert.ToString(idxCt) %>" href="ManageContentType.aspx?List=<%SPHttpUtility.WriteUrlKeyValueEncode(spList.ID.ToString("B").ToUpper(), this);%>&ctype=<%SPHttpUtility.WriteUrlKeyValueEncode(contentType.Id.ToString(), this);%>"> <%SPHttpUtility.WriteHtmlEncode(contentType.Name,this.Page);%></a>
					</td>
					<td class="ms-vb2">
						<% if ( fAllowedCt == true ) { if(SPUtility.ContextCompatibilityLevel >= SPUtility.CompatibilityLevel15) { %> <span class="ms-updatelink-span"><SharePoint:ThemedForegroundImage ThemeKey="spcommon" ImageUrl="/_layouts/15/images/spcommon.png?rev=40" CssClass="ms-updatelink-icon" runat="server" /></span> <% ; } else { %> <img src="/_layouts/15/images/check.gif?rev=40" alt="Checked"> <% ; } }%>
					</td>
					<td class="ms-vb2">
						<% if ( idxCt == 0 == true ) { if(SPUtility.ContextCompatibilityLevel >= SPUtility.CompatibilityLevel15) { %> <span class="ms-updatelink-span"><SharePoint:ThemedForegroundImage ThemeKey="spcommon" ImageUrl="/_layouts/15/images/spcommon.png?rev=40" CssClass="ms-updatelink-icon" runat="server" /></span> <% ; } else { %> <img src="/_layouts/15/images/check.gif?rev=40" alt="Checked"> <% ; } }%>
					</td>
				  </tr>
<%
		idxCt++;
	}
%>
				  </table>
				   </td>
					</tr>
					<tr>
					  <td colspan="4">
					   <table>
					<tr>
					 <td class="ms-foo ms-descriptiontext ms-foo">
					  <img src="/_layouts/15/images/setrect.gif?rev=40" alt="" />&#160;
					 </td>
					 <td class="ms-descriptiontext ms-linksectionitemdescription"><a id="LinkAddContentTypeToList" href="AddContentTypeToList.aspx?List=<%SPHttpUtility.WriteUrlKeyValueEncode(spList.ID.ToString("B").ToUpper(), this);%>"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_addcontenttype%>" EncodeMethod='HtmlEncode'/></a>
							</td>
					</tr>
					<tr>
					 <td class="ms-descriptiontext ms-foo">
					  <img src="/_layouts/15/images/setrect.gif?rev=40" alt="" />&#160;
					 </td>
					 <td class="ms-descriptiontext ms-linksectionitemdescription"><a id="LinkChangeContentTypeOrder" href="ChangeContentTypeOrder.aspx?List=<%SPHttpUtility.WriteUrlKeyValueEncode(spList.ID.ToString("B").ToUpper(), this);%>"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_changecontenttypeorder%>" EncodeMethod='HtmlEncode'/></a>
							</td>
					</tr>
					</table></td></tr>
					</table></td></tr>
<%
}
%>
<%
if (iServerTemplate != (SPListTemplateType)MeetingListTemplateType.MeetingTextbox)
{
%>
<tr><td width="100%"><table width="100%" cellpadding="0" cellspacing="3">
<tr height="10"><td colspan="4" class="ms-linksectionheader" style="padding: 4px;" id="1400"><h3 class="ms-standardheader"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,survedit_questions%>" EncodeMethod='HtmlEncode'/></h3></td></tr>
				  <tr>
						  <td valign="top" colspan="4" class="ms-descriptiontext ms-listedit-sectiondescription" id="1500">
<%
if (IsDocumentLibrary) {
	if (spList.ContentTypesEnabled) { %>
								 <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_fieldsdescription_ect_dl%>" EncodeMethod='HtmlEncode'/>
<% } else {%>
								 <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_fieldsdescription_ect2_dl%>" EncodeMethod='HtmlEncode'/>
<% }
} else if (SPBaseType.Survey == spList.BaseType) { %>
							<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_fieldsdescription_ect2_sruvey%>" EncodeMethod='HtmlEncode'/>
<%
} else {
	if (spList.ContentTypesEnabled) { %>
							<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_fieldsdescription_ect%>" EncodeMethod='HtmlEncode'/>
<% } else {%>
							<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_fieldsdescription_ect2%>" EncodeMethod='HtmlEncode'/>
<% }
} %>
								</td>
						</tr>
<tr><td colspan="4" class="ms-gb"><table width="100%" border="0" cellspacing="0" cellpadding="0" summary=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(spList.Title),this.Page); %> style="padding-bottom:12px">
						<tr>
								<th scope="col" class="ms-vh2-nofilter" width="25%" id="1600">
<% if (spList.HasExternalDataSource) { %>
									<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_column%>" EncodeMethod='HtmlEncode'/>
<% } else { %>
									<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,survedit_question%>" EncodeMethod='HtmlEncode'/>
<% } %>
</th>
								<th scope="col" class="ms-vh2-nofilter" width="25%" id="1700"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,survedit_typeanswer%>" EncodeMethod='HtmlEncode'/></th>
								<th scope="col" class="ms-vh2-nofilter"
width="25%"
id="1800">
<% if (!spList.ContentTypesEnabled) { %>
								<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_required%>" EncodeMethod='HtmlEncode'/>
<% } else { %>
								<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_used_in%>" EncodeMethod='HtmlEncode'/>
<% } %>
								</th>
								<th scope="col" class="ms-vh2-nofilter" width="25%" id="1900"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,survey_branching%>" EncodeMethod='HtmlEncode'/></th>
						</tr>
<%
rowClass = "ms-alternating";
bool questionExists = false;
for (Int32 iIndex = 0; iIndex < spFields.Count; iIndex ++ )
{
	SPField spField = (SPField)spFields[iIndex];
	SPFieldLookup fldLookup = spField as SPFieldLookup;
	bool bCountRelated = fldLookup != null && fldLookup.CountRelated;
	bool bMcolLookup = fldLookup != null && fldLookup.IsDependentLookup &&
									fldLookup.LookupList != "Docs";
	SPFieldType t = spField.Type;
	if ( t == SPFieldType.Computed ||
		t == SPFieldType.File ||
		t == SPFieldType.Recurrence ||
		t == SPFieldType.CrossProjectLink ||
		t == SPFieldType.AllDayEvent)
{
		continue;
}
	if (!spField.Reorderable &&
		!bCountRelated &&
		!(spField.ReadOnlyField && (spField.Type == SPFieldType.User  || spField.InternalName == "Modified" || spField.InternalName == "Created")) &&
		!(bMcolLookup && !spField.Hidden) &&
		!spList.HasExternalDataSource)
{
		continue;
}
	if (spField.ShowInListSettings == false)
{
		continue;
}
	if ((spField.ReadOnlyField && !bCountRelated && !bMcolLookup) ||
		spList.HasExternalDataSource)
{
		switch (spField.Type)
{
			case SPFieldType.Calculated:
			rowClass = (rowClass == "")? "ms-alternating" : "";
%>
				  <tr class="<%=rowClass%>">
					<td class="ms-vb2">
					<a id="LinkEditField<%= Convert.ToString(iIndex) %>" href="FldEdit.aspx?List=<%SPHttpUtility.WriteUrlKeyValueEncode(spList.ID.ToString("B").ToUpper(), this);%>&Field=<%SPHttpUtility.WriteUrlKeyValueEncode(spField.InternalName, this);%>"> <%SPHttpUtility.WriteHtmlEncode(spField.Title,this.Page);%></a>
					</td>
					<td class="ms-vb2"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_calculated%>" EncodeMethod='HtmlEncode'/>
					</td>
					<td colspan="2" class="ms-vb2"><%SPHttpUtility.WriteHtmlEncode(GetUsedIn(spField), this);%>
					</td>
				  </tr>
<%
			break;
			case SPFieldType.User:
				break;
			default:
				if (spField.InternalName == "Modified" || spField.InternalName == "Created")
{
					rowClass = (rowClass == "")? "ms-alternating" : "";
%>
				  <tr class="<%=rowClass%>">
					<td class="ms-vb2">
					<a id="LinkEditField<%= Convert.ToString(iIndex) %>" href="FldEditEx.aspx?List=<%SPHttpUtility.WriteUrlKeyValueEncode(spList.ID.ToString("B").ToUpper(), this);%>&Field=<%SPHttpUtility.WriteUrlKeyValueEncode(spField.InternalName, this);%>"> <%SPHttpUtility.WriteHtmlEncode(spField.Title,this.Page);%></a>
					</td>
					<td class="ms-vb2"><%SPHttpUtility.WriteHtmlEncode(spField.TypeDisplayName, this);%>
					</td>
					<td colspan="2" class="ms-vb2"><%SPHttpUtility.WriteHtmlEncode(GetUsedIn(spField), this);%>
					</td>
				  </tr>
<%
}
else if (!spField.Hidden)
{
					if (spField.XPath != null || spList.HasExternalDataSource)
{
%>
					<tr class="<%=rowClass%>">
					<td class="ms-vb2">
					<%SPHttpUtility.WriteHtmlEncode(spField.Title,this.Page);%>
					</td>
					<td class="ms-vb2"><%SPHttpUtility.WriteHtmlEncode(spField.TypeDisplayName, this);%></td>
					<td colspan="2" class="ms-vb2">
						<% if ( !spList.ContentTypesEnabled && spField.Required == true ) { if(SPUtility.ContextCompatibilityLevel >= SPUtility.CompatibilityLevel15) { %> <span class="ms-updatelink-span"><SharePoint:ThemedForegroundImage ThemeKey="spcommon" ImageUrl="/_layouts/15/images/spcommon.png?rev=40" CssClass="ms-updatelink-icon" runat="server" /></span> <% ; } else { %> <img src="/_layouts/15/images/check.gif?rev=40" alt="Checked"> <% ; } }%>
						<%SPHttpUtility.WriteHtmlEncode(GetUsedIn(spField), this);%>
					</td>
					</tr>
<%
}
}
				break;
}
}
else
{
		rowClass = (rowClass == "")? "ms-alternating" : "";
%>
					<tr class="<%=rowClass%>"><td class="ms-vb2">
<%
if (Enum.IsDefined(typeof(SPFieldType), spField.TypeAsString) && spField.Type != SPFieldType.Lookup && spField.Type != SPFieldType.User) {
	questionExists = true;
%>
					<a id="LinkEditField<%= Convert.ToString(iIndex) %>" href="QstEdit.aspx?List=<%SPHttpUtility.WriteUrlKeyValueEncode(spList.ID.ToString("B").ToUpper(), this);%>&Field=<%SPHttpUtility.WriteUrlKeyValueEncode(spField.InternalName, this);%>"> <%SPHttpUtility.WriteHtmlEncode(spField.Title,this.Page);%></a>
<%} else {%>
					<a id="LinkEditField<%= Convert.ToString(iIndex) %>" href="FldEditEx.aspx?List=<%SPHttpUtility.WriteUrlKeyValueEncode(spList.ID.ToString("B").ToUpper(), this);%>&Field=<%SPHttpUtility.WriteUrlKeyValueEncode(spField.InternalName, this);%>"> <%SPHttpUtility.WriteHtmlEncode(spField.Title,this.Page);%></a>
<%}%>
					</td>
					<td class="ms-vb2"><%SPHttpUtility.WriteHtmlEncode(spField.TypeDisplayName, this);%></td>
					<td
					class="ms-vb2">
						<% if ( !spList.ContentTypesEnabled && spField.Required == true ) { if(SPUtility.ContextCompatibilityLevel >= SPUtility.CompatibilityLevel15) { %> <span class="ms-updatelink-span"><SharePoint:ThemedForegroundImage ThemeKey="spcommon" ImageUrl="/_layouts/15/images/spcommon.png?rev=40" CssClass="ms-updatelink-icon" runat="server" /></span> <% ; } else { %> <img src="/_layouts/15/images/check.gif?rev=40" alt="Checked"> <% ; } }%>
						<%SPHttpUtility.WriteHtmlEncode(GetUsedIn(spField), this);%>
					</td>
					<td class="ms-vb2">
					<%
						bool bHasJumpTo = false;
						if (spField.Type == SPFieldType.Choice)
{
							SPFieldChoice choice = (SPFieldChoice)spField;
							Int32 j;
							for (j=0; j < choice.ChoicesJumpTo.Count && !bHasJumpTo; j++)
								bHasJumpTo= (choice.ChoicesJumpTo[j] != null);
							if (!bHasJumpTo
								&& choice.FillInChoice
								&& choice.FillinChoiceJumpTo != null)
{
									bHasJumpTo = true;
}
}
else if (spField.Type == SPFieldType.Boolean)
{
							SPFieldBoolean boolean = (SPFieldBoolean)spField;
							if (boolean.JumpToYesField != null || boolean.JumpToNoField != null)
{
								bHasJumpTo = true;
}
}
else if (spField.JumpToField != null)
{
								bHasJumpTo = true;
}
					 %>
						<% if ( bHasJumpTo == true ) { if(SPUtility.ContextCompatibilityLevel >= SPUtility.CompatibilityLevel15) { %> <span class="ms-updatelink-span"><SharePoint:ThemedForegroundImage ThemeKey="spcommon" ImageUrl="/_layouts/15/images/spcommon.png?rev=40" CssClass="ms-updatelink-icon" runat="server" /></span> <% ; } else { %> <img src="/_layouts/15/images/check.gif?rev=40" alt="Checked"> <% ; } }%>
					</td>
					</tr>
<%
}
}
for (int i = 0; i < invalidFldsDispNames.Count; i++)
{
	rowClass = (rowClass == "")? "ms-alternating" : "";
	strField = invalidFldsIntNames[i].ToString();
	string strurl = strHttpPath
			+ "Cmd=DeleteField&"
			+ strListParam
			+ "&Field="
			+ strField
			+ "&owshiddenversion="
			+ spList.Version.ToString()
			+ "&NextUsing="
			+ strNextUsing;
%>
				   <tr class="<%=rowClass%>">
					<td class="ms-vb2">
					<%SPHttpUtility.WriteHtmlEncode(invalidFldsDispNames[i].ToString(),this.Page);%>
					</td>
					<td
					<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_invalidfld_type%>" EncodeMethod='HtmlEncode'/>
					</td>
					<td colspan="2" class="ms-vb2">
					<a href = "#" onclick='SubmitFormPost(<% SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(strurl),this); %>);'><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,listedit_delete_invalidfld%>" EncodeMethod='HtmlEncode'/></a>
					</td>
				  </tr>
<%
}
%>
   </table></td></tr>
<%
if ((!spList.HasExternalDataSource) && (!questionExists))
{
%>
					 <tr>
					  <td colspan="4">
					   <table cellpadding="0" cellspacing="0" style="padding-left: 5px" >
						 <tr>
								<td class="ms-descriptiontext ms-foo" >
								<img src="/_layouts/15/images/setrect.gif?rev=40" alt="" />&#160;
								</td>
								<td class="ms-descriptiontext ms-linksectionitemdescription">
								<a id="onetidListEdit3" href="qstNew.aspx?List=<%SPHttpUtility.WriteUrlKeyValueEncode(spList.ID.ToString("B").ToUpper(), this);%>"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,survedit_addquestion%>" EncodeMethod='HtmlEncode'/></a>
								</td>
						</tr>
					  </table>
					 </td>
					</tr>
<%
}
%>
 </table></td></tr>
				   <tr height="24"><td>&#160;</td></tr>
<%
}
%>
		<tr height="60"><td>&#160;</td></tr>
	</table>
	<SharePoint:FormDigest runat=server/>
</asp:Content>
<%@ Register TagPrefix="wssuc" TagName="TopNavBar" src="~/_controltemplates/15/TopNavBar.ascx" %>
<asp:Content contentplaceholderid="PlaceHolderTopNavBar" runat="server">
  <wssuc:TopNavBar id="IdTopNavBar" runat="server" Version="4" ShouldUseExtra="true"/>
</asp:Content>
<asp:Content contentplaceholderid="PlaceHolderHorizontalNav" runat="server"/>
<asp:Content contentplaceholderid="PlaceHolderSearchArea" runat="server"/>
<asp:Content contentplaceholderid="PlaceHolderTitleBreadcrumb" runat="server">
  <SharePoint:UIVersionedContent UIVersion="3" runat="server"><ContentTemplate>
	<asp:SiteMapPath
		SiteMapProvider="SPXmlContentMapProvider"
		id="ContentMap"
		SkipLinkText=""
		NodeStyle-CssClass="ms-sitemapdirectional"
		RootNodeStyle-CssClass="s4-die"
		PathSeparator="&#160;&gt; "
		PathSeparatorStyle-CssClass = "s4-bcsep"
		runat="server" />
  </ContentTemplate></SharePoint:UIVersionedContent>
  <SharePoint:UIVersionedContent UIVersion="4" runat="server"><ContentTemplate>
	<SharePoint:ListSiteMapPath
		runat="server"
		SiteMapProviders="SPSiteMapProvider,SPXmlContentMapProvider"
		RenderCurrentNodeAsLink="false"
		PathSeparator=""
		CssClass="s4-breadcrumb"
		NodeStyle-CssClass="s4-breadcrumbNode"
		CurrentNodeStyle-CssClass="s4-breadcrumbCurrentNode"
		RootNodeStyle-CssClass="s4-breadcrumbRootNode"
		HideInteriorRootNodes="true"
		SkipLinkText="" />
  </ContentTemplate></SharePoint:UIVersionedContent>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitleInTitleArea" runat="server">
<asp:SiteMapPath runat="server" ParentLevelsDisplayed="1" SiteMapProvider="SPXmlContentMapProvider" SkipLinkText=""> <PATHSEPARATORTEMPLATE> <SharePoint:ClusteredDirectionalSeparatorArrow runat="server" /> </PATHSEPARATORTEMPLATE> </asp:SiteMapPath>
</asp:Content>
