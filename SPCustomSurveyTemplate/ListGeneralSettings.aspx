<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%> <%@ Page Language="C#" DynamicMasterPageFile="~masterurl/default.master" Inherits="Xnet.SP.Kolektor.Layouts.Xnet.SP.Kolektor.ListGeneralSettings"       %> <%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" src="~/_controltemplates/15/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" src="~/_controltemplates/15/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" src="~/_controltemplates/15/ButtonSection.ascx" %>
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content contentplaceholderid="PlaceHolderPageTitle" runat="server">
	<SharePoint:FormattedStringWithListType runat="server"
		String="<%$Resources:wss,listgeneralsettings_pagetitle%>" LowerCase="false" />
</asp:Content>
<asp:Content contentplaceholderid="PlaceHolderPageDescription" runat="server">
</asp:Content>
<asp:Content contentplaceholderid="PlaceHolderAdditionalPageHead" runat="server">
<SharePoint:ScriptBlock runat="server">
var L_alert3_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,lstsetng_L_alert3_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
function _spFormOnSubmit()
{
	var ListTitleElem = (document.getElementById("<%= TxtListTitle.ClientID %>"));
	ListTitleElem.value = TrimSpaces(ListTitleElem.value);
	if (ListTitleElem.value.length < 1)
	{
		window.alert(L_alert3_Text);
		ListTitleElem.focus();
		return false;
	}
	return true;
}
</SharePoint:ScriptBlock>
</asp:Content>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
<table class="propertysheet" border="0" cellspacing="0" cellpadding="0">
<wssuc:InputFormSection runat="server"
	Title="<%$Resources:wss,lstsetng_namedescription_title%>"
	>
	<Template_Description>
		<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,lstsetng_list_desc%>" EncodeMethod='HtmlEncode'/>
		<SharePoint:FormattedStringWithListType runat="server"
			String="<%$Resources:wss,lstsetng_desc_text%>" />
	</Template_Description>
   <Template_InputFormControls>
		<wssuc:InputFormControl LabelText="<%$Resources:wss,lstsetng_name_labelcolon%>" runat="server">
			 <Template_Control>
				<wssawc:InputFormTextBox title="<%$Resources:wss,lstsetng_name_label%>" CssClass="ms-input" ID="TxtListTitle" Columns="35" Runat="server" MaxLength=255 />
			 </Template_Control>
		</wssuc:InputFormControl>
		<wssuc:InputFormControl LabelText="<%$Resources:wss,lstsetng_desc_titlecolon%>" runat="server">
			 <Template_Control>
				<wssawc:InputFormTextBox title="<%$Resources:wss,lstsetng_desc_title%>" class="ms-input" ID="TxtListDescription" Runat="server" TextMode="MultiLine" Columns="40" Rows="3"/>
			 </Template_Control>
		</wssuc:InputFormControl>
   </Template_InputFormControls>
</wssuc:InputFormSection>
<wssuc:InputFormSection runat="server"
	id="NavigationSection"
	Title="<%$Resources:wss,lstsetng_nav_title%>"
	>
	<Template_Description>
		<SharePoint:FormattedStringWithListType runat="server"
			String="<%$Resources:wss,lstsetng_nav_desc_15%>" />
	</Template_Description>
	<Template_InputFormControls>
		<wssuc:InputFormControl runat="server">
			<Template_LabelText>
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<img border="0" src="/_layouts/15/images/leftnav.gif?rev=40" alt="">&#160;&#160;
						</td >
						<td class="ms-authoringcontrols">
							<SharePoint:FormattedStringWithListType runat="server"
								String="<%$Resources:wss,lstsetng_display%>" AllowSimpleTextFormatting="true" />
						</td>
					</tr>
				</table>
			</Template_LabelText>
			<Template_Control>
				<asp:RadioButton id="RadDisplayOnLeftYes"
					GroupName="displayOnLeft"
					Text="<%$Resources:wss,multipages_yes%>"
					Title="<%$Resources:wss,lstsetng_disponleftyestitle%>"
					Checked="true"
					runat="server"/>
				&#160;&#160;
				<asp:RadioButton id="RadDisplayOnLeftNo"
					GroupName="displayOnLeft"
					Text="<%$Resources:wss,multipages_no%>"
					Title="<%$Resources:wss,lstsetng_disponleftnotitle%>"
					runat="server"/>
			</Template_Control>
		</wssuc:InputFormControl>
	</Template_InputFormControls>
</wssuc:InputFormSection>
<!-- Direction Settings-->
<wssuc:InputFormSection runat="server"
	id="DirectionSection"
	Title="<%$Resources:wss,lstsetng_DirectionHeader%>"
	Description="<%$Resources:wss,lstsetng_DirectionDescription%>"
	>
	<Template_InputFormControls>
		<wssuc:InputFormControl runat="server"
			LabelText="<%$Resources:wss,lstsetng_direction_label%>"
			LabelAssociatedControlId="DdlDirection" >
			<Template_Control>
				<asp:DropDownList id="DdlDirection" runat="server">
					<asp:ListItem Value="none" Text="<%$Resources:wss,lstsetng_onetidDirNone%>"/>
					<asp:ListItem Value="ltr" Text="<%$Resources:wss,lstsetng_onetidDirLTR%>"/>
					<asp:ListItem Value="rtl" Text="<%$Resources:wss,lstsetng_onetidDirRTL%>"/>
				</asp:DropDownList>
			</Template_Control>
		</wssuc:InputFormControl>
	</Template_InputFormControls>
</wssuc:InputFormSection>
<!--Survey settings-->
<wssuc:InputFormSection runat="server"
	id="SurveySection"
	Title="<%$Resources:wss,lstsetng_survey_title%>"
	Description="<%$Resources:wss,lstsetng_survey_description%>"
	>
	<Template_InputFormControls>
		<wssuc:InputFormControl LabelText="<%$Resources:wss,lstsetng_hideusername%>" runat="server">
			<Template_Control>
				<asp:RadioButton id="RadShowUserYes"
					GroupName="showUser"
					Text="<%$Resources:wss,lstsetng_showusernamesyes_label%>"
					Title="<%$Resources:wss,lstsetng_showusernamesyes_title%>"
					Checked="true"
					runat="server"/>
				&#160;&#160;
				<asp:RadioButton id="RadShowUserNo"
					GroupName="showUser"
					Text="<%$Resources:wss,lstsetng_showusernamesno_label%>"
					Title="<%$Resources:wss,lstsetng_showusernamesno_title%>"
					runat="server"/>
			</Template_Control>
		</wssuc:InputFormControl>
		<TR><TD class="ms-authoringcontrols" colspan=3 height=6><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></TD></TR>
		<wssuc:InputFormControl LabelText="<%$Resources:wss,lstsetng_allowmultiple%>" runat="server">
			<Template_Control>
				<asp:RadioButton id="RadAllowMultiResponseYes"
					GroupName="allowMultiple"
					Text="<%$Resources:wss,lstsetng_allowmultipleyes_label%>"
					Title="<%$Resources:wss,lstsetng_allowmultipleyes_title%>"
					Checked="true"
					runat="server"/>
				&#160;&#160;
				<asp:RadioButton id="RadAllowMultiResponseNo"
					GroupName="allowMultiple"
					Text="<%$Resources:wss,lstsetng_allowmultipleno_label%>"
					Title="<%$Resources:wss,lstsetng_allowmultipleno_title%>"
					runat="server"/>
			</Template_Control>
		</wssuc:InputFormControl>
	</Template_InputFormControls>
</wssuc:InputFormSection>
<!--Event settings-->
<wssuc:InputFormSection runat="server"
	id="EventSection"
	Title="<%$Resources:wss,lstsetng_event_title%>"
	Description="<%$Resources:wss,lstsetng_event_description%>"
	>
	<Template_InputFormControls>
		<wssuc:InputFormControl LabelText="<%$Resources:wss,lstsetng_event_enablepeopleselector%>" runat="server">
			<Template_Control>
				<asp:RadioButton id="RadEnablePeopleSelectorYes"
					GroupName="enablePeopleSelector"
					Text="<%$Resources:wss,lstsetng_event_enablepeopleselectoryes%>"
					Title="<%$Resources:wss,lstsetng_event_enablepeopleselectoryes_tooltip%>"
					Checked="true"
					runat="server"/>
				&#160;&#160;
				<asp:RadioButton id="RadEnablePeopleSelectorNo"
					GroupName="enablePeopleSelector"
					Text="<%$Resources:wss,lstsetng_event_enablepeopleselectorno%>"
					Title="<%$Resources:wss,lstsetng_event_enablepeopleselectorno_tooltip%>"
					runat="server"/>
			</Template_Control>
		</wssuc:InputFormControl>
		<asp:PlaceHolder runAt="server" id="ResourcePlaceHolder">
		<wssuc:InputFormControl LabelText="<%$Resources:wss,lstsetng_event_enableresourceselector%>" runat="server">
			<Template_Control>
				<asp:RadioButton id="RadEnableResourceSelectorYes"
					GroupName="enableResourceSelector"
					Text="<%$Resources:wss,lstsetng_event_enableresourceselectoryes%>"
					Title="<%$Resources:wss,lstsetng_event_enableresourceselectoryes_tooltip%>"
					Checked="true"
					runat="server"/>
				&#160;&#160;
				<asp:RadioButton id="RadEnableResourceSelectorNo"
					GroupName="enableResourceSelector"
					Text="<%$Resources:wss,lstsetng_event_enableresourceselectorno%>"
					Title="<%$Resources:wss,lstsetng_event_enableresourceselectorno_tooltip%>"
					runat="server"/>
			</Template_Control>
		</wssuc:InputFormControl>
		</asp:PlaceHolder>
	</Template_InputFormControls>
</wssuc:InputFormSection>
<wssuc:ButtonSection runat="server">
	<Template_Buttons>
		<asp:Button UseSubmitBehavior="false" runat="server" class="ms-ButtonHeightWidth" OnClick="BtnSave_Click" Text="<%$Resources:wss,multipages_savebutton_text%>" id="BtnSave" accesskey="<%$Resources:wss,multipages_savebutton_accesskey%>"/>
	</Template_Buttons>
</wssuc:ButtonSection>
</table>
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
