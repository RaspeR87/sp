<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%> <%@ Page Language="C#" DynamicMasterPageFile="~masterurl/default.master" Inherits="Xnet.SP.Kolektor.Layouts.Xnet.SP.Kolektor.advsetng"       %> <%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" src="~/_controltemplates/15/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" src="~/_controltemplates/15/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" src="~/_controltemplates/15/ButtonSection.ascx" %>
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Import Namespace="Microsoft.SharePoint.Meetings"  %>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<SharePoint:FormattedStringWithListType runat="server"
		String="<%$Resources:wss,advsetng_pagetitle%>" LowerCase="false" />
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageDescription" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderAdditionalPageHead" runat="server">
<SharePoint:ScriptBlock runat="server">
var L_entersendtourl_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,lstsetng_L_alertentersendtourl_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
var L_entersendtoname_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,lstsetng_L_alertentersendtoname_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
var L_sendtonopipes_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,lstsetng_L_alertsendtonopipes_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
function ShowHideDocumentTemplate()
{
	var templateControl = (document.getElementById("<%= TxtListDocumentTemplate.ClientID %>"));
	var linkDocControl = (document.getElementById("<%= linkDoc.ClientID %>"));
	var contentTypeEnabled = (document.getElementById("<%= RadEnableContentTypesYes.ClientID %>"));
	if (templateControl == null || contentTypeEnabled == null)
		return true;
	if (contentTypeEnabled.checked)
	{
		templateControl.disabled = true;
		if (linkDocControl != null)
		{
			linkDocControl.disabled = true;
			linkDocControl.style.display = "none";
		}
	}
	else
	{
		templateControl.disabled = false;
		if (linkDocControl != null)
		{
			linkDocControl.disabled = false;
			linkDocControl.style.display = "inline";
		}
	}
	return true;
}
function _spBodyOnLoad()
{
	if (typeof(SetReadWriteSecuritySettings) == "function")
	{
		SetReadWriteSecuritySettings();
	}
	ShowHideDocumentTemplate();
}
function _disableReindexButton()
{
	 var reindexListButton = document.getElementById('<%=ReindexListButton.ClientID%>');
	 reindexListButton.disabled = true;
	 var radAllowNonDefaultCrawlViewYes = document.getElementById('<%=RadAllowNonDefaultCrawlViewYes.ClientID%>');
	 radAllowNonDefaultCrawlViewYes.disabled = true;
	 var radAllowNonDefaultCrawlViewNo = document.getElementById('<%=RadAllowNonDefaultCrawlViewNo.ClientID%>');
	 radAllowNonDefaultCrawlViewNo.disabled = true;
}
function _enableReindexButton()
{
	 var reindexListButton = document.getElementById('<%=ReindexListButton.ClientID%>');
	 reindexListButton.disabled = false;
	 var radAllowNonDefaultCrawlViewYes = document.getElementById('<%=RadAllowNonDefaultCrawlViewYes.ClientID%>');
	 radAllowNonDefaultCrawlViewYes.disabled = false;
	 var radAllowNonDefaultCrawlViewNo = document.getElementById('<%=RadAllowNonDefaultCrawlViewNo.ClientID%>');
	 radAllowNonDefaultCrawlViewNo.disabled = false;
}
function _spFormOnSubmit()
{
	if (typeof(ConfirmDisableAttachment) == "function")
	{
		if (!ConfirmDisableAttachment())
			return false;
	}
	var sendToNameElem = (document.getElementById("<%= TxtSendToLocationName.ClientID %>"));
	var sendToUrlElem = (document.getElementById("<%= TxtSendToLocationUrl.ClientID %>"));
	if (typeof(sendToNameElem) != "undefined" &&
		typeof(sendToUrlElem) != "undefined" &&
		sendToNameElem != null &&
		sendToUrlElem != null)
	{
		var sendToName = sendToNameElem.value;
		var sendToUrl = sendToUrlElem.value;
		if ( sendToName.length > 0 ||
			 sendToUrl.length > 0)
		{
			if (sendToName.length == 0)
			{
				alert(L_entersendtoname_Text);
				return false;
			}
			if (sendToUrl.length == 0)
			{
				alert(L_entersendtourl_Text);
				return false;
			}
			if ( -1 != sendToName.search("\\|") ||
				 -1 != sendToUrl.search("\\|") )
			{
				alert(L_sendtonopipes_Text);
				return false;
			}
			if (typeof(sendToUrl) == "undefined" || sendToUrl == null ||
				!HasValidUrlPrefix(sendToUrl))
			{
				alert(L_entersendtourl_Text);
				return false;
			}
		}
	}
	return true;
}
function OnReindexListButtonClick()
{
	var popupUrl = 'ReindexListDialog.aspx'+ajaxNavigate.get_search();
	var popupTitle = <%if ( List.BaseType == SPBaseType.DocumentLibrary){%>"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,libsetng_reindex_title%>' EncodeMethod='HtmlEncode'/>"<%}else{%>"<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,lstsetng_reindex_title%>' EncodeMethod='HtmlEncode'/>"<%}%>;
	EnsureScriptFunc('SP.init.js', 'SP.PageContextInfo', function ()
		{
			SP.SOD.execute('sp.ui.dialog.js', 'SP.UI.ModalDialog.showModalDialog',
			{
				url:popupUrl,
				title:popupTitle,
				dialogReturnValueCallback:ReindexListDialogCallback
			});
		});
	return false;
}
function ReindexListDialogCallback()
{
	commonModalDialogClose(0,null);
}
</SharePoint:ScriptBlock>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
	<table class="propertysheet" border="0" cellspacing="0" cellpadding="0">
	<!-- content types -->
	<wssuc:InputFormSection runat="server"
		id="ContentTypeSection"
		Title="<%$Resources:wss,lstsetng_contenttypes_title%>"
		>
		<Template_Description>
			<SharePoint:FormattedStringWithListType runat="server"
				String="<%$Resources:wss,lstsetng_addnewcontenttypes_desc%>" />
		</Template_Description>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				LabelText="<%$Resources:wss,lstsetng_contenttypes_shortq%>"
				>
				<Template_Control>
					<asp:RadioButton id="RadEnableContentTypesYes"
						GroupName="EnableContentTypes"
						Text="<%$Resources:wss,multipages_yes%>"
						onclick="ShowHideDocumentTemplate();"
						Checked="true"
						runat="server"/>
					&#160;&#160;
					<asp:RadioButton id="RadEnableContentTypesNo"
						GroupName="EnableContentTypes"
						Text="<%$Resources:wss,multipages_no%>"
						onclick="ShowHideDocumentTemplate();"
						runat="server"/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
<!--Template-->
	<wssuc:InputFormSection runat="server"
		id="DocumentTemplateSection"
		Title="<%$Resources:wss,lstsetng_doctemp%>"
		>
		<Template_Description>
			<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,lstsetng_doctemp_addr%>" EncodeMethod='HtmlEncode'/>
			<SharePoint:FormattedString id="helptopic_WSSEndUser_templates" FormatText="<%$Resources:wss,helptopic_link%>" EncodeMethod="NoEncode" runat="server"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,CSH_ConfigureTemplate%>" EncodeMethod='HtmlEncode'/> <SharePoint:EncodedLiteral runat="server" text='WSSEndUser_templates' EncodeMethod='EcmaScriptStringLiteralEncode'/> </SharePoint:FormattedString>
		</Template_Description>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				LabelText="<%$Resources:wss,lstsetng_doctemp_url_label%>"
				>
				<Template_Control>
					<span dir="ltr">
						<wssawc:InputFormTextBox title="<%$Resources:wss,lstsetng_doctemp_url%>" class="ms-input" Columns="35" ID="TxtListDocumentTemplate" Runat="server" />
					</span><br/>
					<SharePoint:EditDocumentLink id="linkDoc" runat="server"
						Text="<%$Resources:wss,listedit_edittemplate%>"/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
<!-- Security Settings -->
	<asp:PlaceHolder runat="server" id="ItemLevelSecurityPanel">
	<wssuc:InputFormSection runat="server"
		id="ItemLevelSecuritySection"
		Title="<%$Resources:wss,lstsetng_itemlevel_perm%>"
		>
		<Template_Description>
			<% if (!IsSurvey) { %>
				<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,lstsetng_itemlevel_desc_list%>" EncodeMethod='HtmlEncode'/>
				<br/><br/>
				<b><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,multipages_note_colon%>" EncodeMethod='HtmlEncode'/></b>
				<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,lstsetng_itemlevel_desc_list2%>" EncodeMethod='HtmlEncode'/>
			<% } else { %>
				<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,lstsetng_itemlevel_desc_survey%>" EncodeMethod='HtmlEncode'/>
				<br/><br/>
				<b><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,multipages_note_colon%>" EncodeMethod='HtmlEncode'/></b>
				<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,lstsetng_itemlevel_desc_survey2%>" EncodeMethod='HtmlEncode'/>
			<% } %>
			<SharePoint:FormattedString id="helptopic_WSSEndUser_ItemLevelPermissions" FormatText="<%$Resources:wss,helptopic_link%>" EncodeMethod="NoEncode" runat="server"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,CSH_ItemLevelPermissions%>" EncodeMethod='HtmlEncode'/> <SharePoint:EncodedLiteral runat="server" text='WSSEndUser_ItemLevelPermissions' EncodeMethod='EcmaScriptStringLiteralEncode'/> </SharePoint:FormattedString>
		</Template_Description>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				>
				<Template_LabelText>
					<b><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,lstsetng_readacc%>" EncodeMethod='HtmlEncode'/></b>&#160;&#160;
					<% if (!IsSurvey) { %>
						<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,lstsetng_readacc_list%>" EncodeMethod='HtmlEncode'/>
					<% } else { %>
						<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,lstsetng_readacc_survey%>" EncodeMethod='HtmlEncode'/>
					<% } %>
				</Template_LabelText>
				<Template_Control>
					<asp:RadioButton runat="server"
						id="RadReadSecurityAll"
						GroupName="ReadSecurity"
						Title="<%$Resources:wss,lstsetng_readacc_allitemstitle%>"
						Value="1"
						Text="<%$Resources:wss,lstsetng_readacc_allitems%>"
						/>
					<br/>
					<asp:RadioButton runat="server"
						id="RadReadSecurityOwn"
						GroupName="ReadSecurity"
						Title="<%$Resources:wss,lstsetng_readacc_ownitemstitle%>"
						Value="2"
						Text="<%$Resources:wss,lstsetng_readacc_ownitems%>"
						/>
				</Template_Control>
			</wssuc:InputFormControl>
			<wssuc:InputFormControl runat="server"
				>
				<Template_LabelText>
					<b><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,lstsetng_editacc%>" EncodeMethod='HtmlEncode'/></b>&#160;&#160;
					<% if (!IsSurvey) { %>
						<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,lstsetng_editsec_list%>" EncodeMethod='HtmlEncode'/>
					<% } else { %>
					<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,lstsetng_editsec_survey%>" EncodeMethod='HtmlEncode'/>
					<% } %>
				</Template_LabelText>
				<Template_Control>
					<asp:RadioButton runat="server"
						id="RadWriteSecurityAll"
						GroupName="WriteSecurity"
						title="<%$Resources:wss,lstsetng_writeacc_items1%>"
						Text="<%$Resources:wss,lstsetng_writeacc_allitems%>"
						Value="1"
						/>
					<br/>
					<asp:RadioButton runat="server"
						id="RadWriteSecurityOwn"
						GroupName="WriteSecurity"
						title="<%$Resources:wss,lstsetng_writeacc_items2%>"
						text="<%$Resources:wss,lstsetng_writeacc_ownitems%>"
						value="2"
						/>
					<br/>
					<asp:RadioButton runat="server"
						id="RadWriteSecurityNone"
						GroupName="WriteSecurity"
						title="<%$Resources:wss,lstsetng_writeacc_items3%>"
						Text="<%$Resources:wss,lstsetng_ws_none%>"
						Value="4"
						/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
<SharePoint:ScriptBlock runat="server">
	function SetReadWriteSecuritySettings()
	{
<%
int iReadSecurity = List.ReadSecurity;
int iWriteSecurity = List.WriteSecurity;
%>
		var readSecurity = <%SPHttpUtility.WriteNoEncode(iReadSecurity,this.Page);%>;
		var writeSecurity = <%SPHttpUtility.WriteNoEncode(iWriteSecurity,this.Page);%>;
		(document.getElementById("<%= RadReadSecurityAll.ClientID %>")).checked = (1 == readSecurity) ;
		(document.getElementById("<%= RadReadSecurityOwn.ClientID %>")).checked = (2 == readSecurity);
		(document.getElementById("<%= RadWriteSecurityAll.ClientID %>")).checked = (1 == writeSecurity);
		(document.getElementById("<%= RadWriteSecurityOwn.ClientID %>")).checked = (2 == writeSecurity);
		(document.getElementById("<%= RadWriteSecurityNone.ClientID %>")).checked = (4 == writeSecurity);
	}
</SharePoint:ScriptBlock>
	</asp:PlaceHolder>
	<!-- Open document -->
	<wssuc:InputFormSection runat="server"
		id="OpenDocumentSection"
		Title="<%$Resources:wss,lstsetng_defaultitemopen_header%>"
		Description="<%$Resources:wss,lstsetng_defaultitemopen_description%>"
		>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				LabelText="<%$Resources:wss,lstsetng_defaultitemopen_options%>"
				>
				<Template_Control>
					<asp:RadioButton runat="server"
						GroupName="DefaultItemOpen"
						id="RadDefaultItemOpenPreferClient"
						Title="<%$Resources:wss,lstsetng_defaultitemopen_preferclient%>"
						Text="<%$Resources:wss,lstsetng_defaultitemopen_preferclient%>"
						/>
					<br/>
					<asp:RadioButton runat="server"
						GroupName="DefaultItemOpen"
						id="RadDefaultItemOpenBrowser"
						Title="<%$Resources:wss,lstsetng_defaultitemopen_browser%>"
						Text="<%$Resources:wss,lstsetng_defaultitemopen_browser%>"
						/>
					<br/>
					<asp:RadioButton runat="server"
						GroupName="DefaultItemOpen"
						id="RadDefaultItemOpenServerSetting"
						Title="<%$Resources:wss,lstsetng_defaultitemopen_serverbrowser%>"
						Text="<%$Resources:wss,lstsetng_defaultitemopen_serverbrowser%>"
						/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
	<!--Tasks and Issues email settings-->
	<wssuc:InputFormSection runat="server"
		id="TasksIssuesEmailSettingsSection"
		Title="<%$Resources:wss,lstsetng_assignto_email_title%>"
		Description="<%$Resources:wss,lstsetng_assignto_email_desc%>"
		>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				LabelText="<%$Resources:wss,lstsetng_assignto_email_label%>"
				>
				<Template_Control>
					<asp:RadioButton runat="server"
						id="RadEnableAssigntoEmailYes"
						GroupName="EnableAssignToEmail"
						Text="<%$Resources:wss,multipages_yes%>"
						/>
					&#160;&#160;
					<asp:RadioButton runat="server"
						id="RadEnableAssigntoEmailNo"
						GroupName="EnableAssignToEmail"
						Text="<%$Resources:wss,multipages_no%>"
						/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
	<!--SendTo settings-->
	<wssuc:InputFormSection runat="server"
		Id="SendToSection"
		Title="<%$Resources:wss,lstsetng_sendtoheader%>"
		Description="<%$Resources:wss,lstsetng_sendtodescription15%>"
		>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				LabelText="<%$Resources:wss,lstsetng_sendtoname%>"
				>
				<Template_Control>
					<wssawc:InputFormTextBox title="<%$Resources:wss,lstsetng_sendtoname%>" CssClass="ms-input" ID="TxtSendToLocationName" Columns="35" Runat="server" MaxLength=100 />
				</Template_Control>
			</wssuc:InputFormControl>
			<wssuc:InputFormControl runat="server"
				LabelText="<%$Resources:wss,lstsetng_sendtourl%>"
				>
				<Template_Control>
					<span dir="ltr">
						<wssawc:InputFormTextBox title="<%$Resources:wss,lstsetng_sendtourl%>" CssClass="ms-input" ID="TxtSendToLocationUrl" Columns="35" Runat="server" MaxLength=255 />
					</span>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
		<!-- Event Handler -->
		<wssuc:InputFormSection Title="<%$Resources:wss,advsetng_idInputEventHandlerName%>" runat="server"
			id="EventHandlerSection"
			>
			<Template_InputFormControls>
				<wssuc:InputFormControl LabelText="<%$Resources:wss,advsetng_idInputEventAssemblyName%>" runat="server">
					<Template_Control>
						<wssawc:InputFormTextBox title="<%$Resources:wss,advsetng_assemblyname_title%>" class="ms-input" Columns="35" ID="TxtEventHandlerAssemblyName" Runat="server" />
					</Template_Control>
				</wssuc:InputFormControl>
				<wssuc:InputFormControl LabelText="<%$Resources:wss,advsetng_idInputEventClassName%>" runat="server">
					<Template_Control>
						<wssawc:InputFormTextBox title="<%$Resources:wss,advsetng_classname_title%>" class="ms-input" Columns="35" ID="TxtEventHandlerClassName" Runat="server" />
					</Template_Control>
				</wssuc:InputFormControl>
				<wssuc:InputFormControl LabelText="<%$Resources:wss,advsetng_idInputEventProperties%>" runat="server">
					<Template_Control>
						<wssawc:InputFormTextBox title="<%$Resources:wss,advsetng_handlerproperty_title%>" class="ms-input" ID="TxtEventHandlerProperties" Runat="server" TextMode="MultiLine" Columns="40" Rows="4"/>
					</Template_Control>
				</wssuc:InputFormControl>
			</Template_InputFormControls>
		</wssuc:InputFormSection>
	<!-- Attachments -->
	<asp:PlaceHolder id="PanelAttachments" runat="server">
	<wssuc:InputFormSection runat="server"
		id="AttachmentsSection"
		Title="<%$Resources:wss,lstsetng_attach%>"
		>
		<Template_Description>
			<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,lstsetng_attach_desc%>" EncodeMethod='HtmlEncode'/>
		</Template_Description>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				LabelText="<%$Resources:wss,lstsetng_attach_label%>"
				>
				<Template_Control>
					<asp:RadioButton runat="server" id="RadAttachmentsEnabled"
						GroupName="DisableAttachments"
						Text="<%$Resources:wss,lstsetng_attach_enabled%>"
						Title="<%$Resources:wss,lstsetng_attach_enabled_title%>"
						/>
					<br/>
					<span id="onetidAddToDefaultView">&#160;&#160;&#160;&#160;
						<asp:CheckBox id="ChkAttachmentsAddToDefaultView" runat="server"
							Text="<%$Resources:wss,lstsetng_view_label%>"
							Checked="true"
							Title="<%$Resources:wss,lstsetng_view_title%>"/>
						<br/>
					</span>
					<asp:RadioButton runat="server" id="RadAttachmentsDisabled"
						GroupName="DisableAttachments"
						Text="<%$Resources:wss,lstsetng_view_disabled_label%>"
						Title="<%$Resources:wss,lstsetng_view_disabled_title%>"
						/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
		<SharePoint:ScriptBlock runat="server">
			var attachmentEnabled = <%= List.EnableAttachments ? "true" : "false" %>;
			if (!document.layers && attachmentEnabled)
				document.getElementById("onetidAddToDefaultView").style.display='none';
			function ConfirmDisableAttachment()
			{
				if (attachmentEnabled &&
					(document.layers ||
					 (document.getElementById("<%= RadAttachmentsDisabled.ClientID %>")).checked))
				{
					var L_DisableAttachment_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,lstsetng_L_DisableAttachment_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
					return confirm(L_DisableAttachment_Text);
				}
				else
					return true;
			}
		</SharePoint:ScriptBlock>
	</asp:PlaceHolder>
<!-- Folder Creation  -->
	<wssuc:InputFormSection runat="server"
		id="FolderCreationSection"
		Title="<%$Resources:wss,lstsetng_folderenable_title%>"
		>
		<Template_Description>
			<SharePoint:FormattedStringWithListType runat="server"
				String="<%$Resources:wss,lstsetng_folderenable_Desc%>" />
		</Template_Description>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				>
				<Template_LabelText>
					<SharePoint:FormattedStringWithListType runat="server"
						String="<%$Resources:wss,lstsetng_folderenable_question%>" />
				</Template_LabelText>
				<Template_Control>
					<asp:RadioButton id="RadEnableFoldersYes"
						GroupName="DisableFolders"
						Text="<%$Resources:wss,multipages_yes%>"
						Checked="true"
						runat="server"/>
					&#160;&#160;
					<asp:RadioButton id="RadEnableFoldersNo"
						GroupName="DisableFolders"
						Text="<%$Resources:wss,multipages_no%>"
						runat="server"/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
<!-- Allow search to crawl this list  -->
	<wssuc:InputFormSection runat="server"
		id="AllowCrawlSection"
		Title="<%$Resources:wss,lstsetng_allowcrawl_title%>"
		>
		<Template_Description>
			<SharePoint:FormattedStringWithListType runat="server"
				String="<%$Resources:wss,lstsetng_allowcrawl_Desc%>" />
		</Template_Description>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				>
				<Template_LabelText>
					<SharePoint:FormattedStringWithListType runat="server"
						String="<%$Resources:wss,lstsetng_allowcrawl_question%>" />
				</Template_LabelText>
				<Template_Control>
					<asp:RadioButton id="RadAllowCrawlYes"
						GroupName="AllowCrawl"
						onclick="_enableReindexButton()"
						Text="<%$Resources:wss,multipages_yes%>"
						Checked="true"
						runat="server"/>
					&#160;&#160;
					<asp:RadioButton id="RadAllowCrawlNo"
						onclick="_disableReindexButton()"
						GroupName="AllowCrawl"
						Text="<%$Resources:wss,multipages_no%>"
						runat="server"/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
<!-- Allow search to crawl the non-default views of this list -->
	<wssuc:InputFormSection runat="server"
		id="AllowNonDefaultCrawlViewSection"
		Title="<%$Resources:wss,lstsetng_title_allownondefaultcrawlview%>"
		>
		<Template_Description>
			<SharePoint:FormattedStringWithListType runat="server"
				String="<%$Resources:wss,lstsetng_desc_allownondefaultcrawlview%>" />
		</Template_Description>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				>
				<Template_LabelText>
					<SharePoint:FormattedStringWithListType runat="server"
						String="<%$Resources:wss,lstsetng_question_allownondefaultcrawlview%>" />
				</Template_LabelText>
				<Template_Control>
					<asp:RadioButton id="RadAllowNonDefaultCrawlViewYes"
						GroupName="AllowNonDefaultCrawlView"
						Text="<%$Resources:wss,multipages_yes%>"
						Checked="false"
						runat="server"/>
					&#160;&#160;
					<asp:RadioButton id="RadAllowNonDefaultCrawlViewNo"
						GroupName="AllowNonDefaultCrawlView"
						Text="<%$Resources:wss,multipages_no%>"
						runat="server"/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
	<!-- Mark List for reindex  -->
	<wssuc:InputFormSection runat="server"
		id="ReindexListSection"
		Title="<%$Resources:wss,lstsetng_reindex_title%>">
		<Template_Description>
			<SharePoint:FormattedStringWithListType runat="server" String="<%$Resources:wss,lstsetng_reindex_description%>" LowerCase="false"/>
		</Template_Description>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server">
				<Template_Control>
					<input type="button" id="ReindexListButton" onclick="javascript:OnReindexListButtonClick();" class="ms-ph" runat="server" value="<%$Resources:wss,lstsetng_reindex_btext%>" />
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
<!-- Allow offline synchronization of this list  -->
	<wssuc:InputFormSection runat="server"
		id="AllowSyncSection"
		Title="<%$Resources:wss,lstsetng_allowsync_title%>"
		>
		<Template_Description>
			<SharePoint:FormattedStringWithListType runat="server"
				String="<%$Resources:wss,lstsetng_allowsync_Desc%>" />
		</Template_Description>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				>
				<Template_LabelText>
					<SharePoint:FormattedStringWithListType runat="server"
						String="<%$Resources:wss,lstsetng_allowsync_question%>" />
				</Template_LabelText>
				<Template_Control>
					<asp:RadioButton id="RadAllowSyncYes"
						GroupName="AllowSync"
						Text="<%$Resources:wss,multipages_yes%>"
						Checked="true"
						runat="server"/>
					&#160;&#160;
					<asp:RadioButton id="RadAllowSyncNo"
						GroupName="AllowSync"
						Text="<%$Resources:wss,multipages_no%>"
						runat="server"/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
<!-- Make this an attachment library  -->
	<wssuc:InputFormSection runat="server"
		id="AttachmentLibrarySection"
		Title="<%$Resources:wss,lstsetng_attachmentlibrary_title%>"
		>
		<Template_Description>
			<SharePoint:FormattedStringWithListType runat="server"
				String="<%$Resources:wss,lstsetng_attachmentlibrary_Desc%>" />
		</Template_Description>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				>
				<Template_LabelText>
					<SharePoint:FormattedStringWithListType runat="server"
						String="<%$Resources:wss,lstsetng_attachmentlibrary_question%>" />
				</Template_LabelText>
				<Template_Control>
					<asp:RadioButton id="RadAttachmentLibraryYes"
						GroupName="AttachmentLibrary"
						Text="<%$Resources:wss,multipages_yes%>"
						Checked="true"
						runat="server"/>
					&#160;&#160;
					<asp:RadioButton id="RadAttachmentLibraryNo"
						GroupName="AttachmentLibrary"
						Text="<%$Resources:wss,multipages_no%>"
						runat="server"/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
<!-- Allow Grid Editing -->
	<wssuc:InputFormSection runat="server"
		id="AllowGridEditingSection"
		Title="<%$Resources:wss,lstsetng_allowgrid_title15%>"
		>
		<Template_Description>
			<SharePoint:FormattedStringWithListType runat="server"
				String="<%$Resources:wss,lstsetng_allowgrid_desc15%>" />
		</Template_Description>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				>
				<Template_LabelText>
					<SharePoint:FormattedStringWithListType runat="server"
						String="<%$Resources:wss,lstsetng_allowgrid_question15%>" />
				</Template_LabelText>
				<Template_Control>
					<asp:RadioButton id="RadAllowGridYes"
						GroupName="AllowGrid"
						Text="<%$Resources:wss,multipages_yes%>"
						Checked="true"
						runat="server"/>
					&#160;&#160;
					<asp:RadioButton id="RadAllowGridNo"
						GroupName="AllowGrid"
						Text="<%$Resources:wss,multipages_no%>"
						runat="server"/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
<!-- Global-Meetings-data list -->
	<asp:PlaceHolder id="PanelGlobalMettingsDataList" runat="server">
	<wssuc:InputFormSection runat="server"
		id="GlobalMeetingsDataListSection"
		Title="<%$Resources:wss,lstsetng_allmeetlist%>"
		Description="<%$Resources:wss,lstsetng_meetlist_description%>"
		>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				LabelText="<%$Resources:wss,lstsetng_chgitem_head15%>"
				>
				<Template_Control>
					<asp:RadioButton id="RadGlobalMtgDataListYes"
						GroupName="GlobalMtgDataList"
						Text="<%$Resources:wss,multipages_yes%>"
						Checked="true"
						runat="server"/>
					&#160;&#160;
					<asp:RadioButton id="RadGlobalMtgDataListNo"
						GroupName="GlobalMtgDataList"
						Text="<%$Resources:wss,multipages_no%>"
						runat="server"/>
					<br />
					<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,lstsetng_mtgdl_note%>" EncodeMethod='HtmlEncode'/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
	</asp:PlaceHolder>
<!-- Dialog for forms pages -->
	<wssuc:InputFormSection runat="server"
		id="DialogForFormsPagesSection"
		Title="<%$Resources:wss,lstsetng_dlgforforms_title%>"
		>
		<Template_Description>
			<SharePoint:FormattedStringWithListType runat="server"
				String="<%$Resources:wss,lstsetng_dlgforforms_desc%>" />
			<br/><br/>
			<SharePoint:FormattedStringWithListType runat="server"
				String="<%$Resources:wss,lstsetng_dlgforforms_note%>" />
		</Template_Description>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				>
				<Template_LabelText>
					<SharePoint:FormattedStringWithListType runat="server"
						String="<%$Resources:wss,lstsetng_dlgforforms_question%>" />
				</Template_LabelText>
				<Template_Control>
					<asp:RadioButton id="RadDialogForFormsPagesYes"
						GroupName="DialogForFormsPages"
						Text="<%$Resources:wss,multipages_yes%>"
						Checked="true"
						runat="server"/>
					&#160;&#160;
					<asp:RadioButton id="RadDialogForFormsPagesNo"
						GroupName="DialogForFormsPages"
						Text="<%$Resources:wss,multipages_no%>"
						runat="server"/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
<!-- Allow Auto-Indexes -->
	<wssuc:InputFormSection runat="server"
		id="ManagedIndexesSection"
		Title="<%$Resources:wss,lstsetng_managedindex_title%>"
		>
		<Template_Description>
			<SharePoint:FormattedStringWithListType runat="server"
				String="<%$Resources:wss,lstsetng_managedindex_desc%>" />
		</Template_Description>
		<Template_InputFormControls>
			<wssuc:InputFormControl runat="server"
				>
				<Template_LabelText>
					<SharePoint:FormattedStringWithListType runat="server"
						String="<%$Resources:wss,lstsetng_managedindex_question%>" />
				</Template_LabelText>
				<Template_Control>
					<asp:RadioButton id="RadManagedIndexesYes"
						GroupName="AllowManagedIndex"
						Text="<%$Resources:wss,multipages_yes%>"
						Checked="true"
						runat="server"/>
					&#160;&#160;
					<asp:RadioButton id="RadManagedIndexesNo"
						GroupName="AllowManagedIndex"
						Text="<%$Resources:wss,multipages_no%>"
						runat="server"/>
				</Template_Control>
			</wssuc:InputFormControl>
		</Template_InputFormControls>
	</wssuc:InputFormSection>
	<wssuc:ButtonSection runat="server">
		<Template_Buttons>
			<asp:Button UseSubmitBehavior="false" runat="server" class="ms-ButtonHeightWidth" OnClick="BtnSaveAdvancedSettings_Click" Text="<%$Resources:wss,multipages_okbutton_text%>" id="BtnSaveAsTemplate" accesskey="<%$Resources:wss,okbutton_accesskey%>"/>
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
