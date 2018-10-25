<%@ Assembly Name="Microsoft.SharePoint.ApplicationPages, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%@ Page Language="C#" DynamicMasterPageFile="~masterurl/default.master" Inherits="Microsoft.SharePoint.ApplicationPages.BasicFieldEditPage" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="wssuc" TagName="LinksTable" src="/_controltemplates/15/LinksTable.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" src="/_controltemplates/15/InputFormSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" src="/_controltemplates/15/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="LinkSection" src="/_controltemplates/15/LinkSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ButtonSection" src="/_controltemplates/15/ButtonSection.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ActionBar" src="/_controltemplates/15/ActionBar.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ToolBar" src="/_controltemplates/15/ToolBar.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="ToolBarButton" src="/_controltemplates/15/ToolBarButton.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="Welcome" src="/_controltemplates/15/Welcome.ascx" %>
<%@ Register Tagprefix="wssawc" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=16.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ContentPlaceHolderId="PlaceHolderAdditionalPageHead" runat="server">
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
if (null == spList)
{
	throw new SPException(SPResource.GetString(Strings.ListGone));
}
%>
<SharePoint:ScriptBlock runat="server">
function _spBodyOnLoad()
{
	BodyOnLoad();
}
</SharePoint:ScriptBlock>
<SharePoint:ScriptLink language="javascript" name="bform.js" Localizable="false" runat="server" />
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageDescription" runat="server">
	<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_usepagetoaddquestion%>" EncodeMethod='HtmlEncode'/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_createnewquestion%>" EncodeMethod='HtmlEncode'/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitleInTitleArea" runat="server">
<asp:SiteMapPath runat="server" ParentLevelsDisplayed="1" SiteMapProvider="SPXmlContentMapProvider" SkipLinkText=""> <PATHSEPARATORTEMPLATE> <SharePoint:ClusteredDirectionalSeparatorArrow runat="server" /> </PATHSEPARATORTEMPLATE> </asp:SiteMapPath>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
<script runat="server">
	String strLinkTitle;
	String strList;
	String strName;
	String strDisplayName;
	String strDescription;
	String strFieldTypeParam;
	bool   bRequired;
	bool   bEnforceUniqueValues;
	bool   bIndexed;
	bool   bUnlimitedLengthInDocumentLibrary;
	bool   bSealed;
	bool   bCanBeDeleted;
	String strDirection;
	String strFormat;
	String strDefault;
	String strDefaultFormula;
	bool   fDefaultFormulaEmpty;
	String strDefaultURLDesc;
	int    iMaxLength;
	int    iNumLines;
	double dblMin;
	double dblMax;
	String strDecimals;
	bool   bPercentage;
	bool   bRichText;
	bool bDisableRichTextModeControl;
	SPRichTextMode RichTextMode;
	bool   bAllowHyperlink;
	bool   bAppendOnly;
	String strFromBaseType;
	String strLookupList;
	String strLookupField;
	String strShowPresence;
	String strDisplaySize;
	String strDisplayNameParam;
	bool   bShowIME;
	bool   bShowBidiDirection;
	bool   bShowCalendarUI;
	int    iWebCalType;
	int    iCalType;
	bool   bUseDefault;
	String strCalType;
	String strChoiceTextArea;
	String strGridChoiceTextArea;
	int    GridStartNum;
	int    GridEndNum;
	String strGridTxtRng1;
	String strGridTxtRng2;
	String strGridTxtRng3;
	String strGridNATxt;
	String strIMEMode;
	String strFillInChoice;
	String strResultType;
	String strFormula;
	SPView spDefaultView;
	string strHiddenSchema;
	string strCheckedLiteral;
	string strFriendlyFormat;
	bool bPrevDeniedState;
	string strDisableRequired;
	string strDisableEnforceUniqueValues;
	string L_strAutoIndexConfirm_Text;
	bool bAllowFieldTypeChange;
</script>
<%
	strLinkTitle = "";
	strList = "";
	strName = "";
	strDisplayName = "";
	strDescription = "";
	strFieldTypeParam = "";
	bRequired = false;
	bEnforceUniqueValues = false;
	bIndexed = false;
	bUnlimitedLengthInDocumentLibrary = false;
	bSealed = false;
	bCanBeDeleted = true;
	strDirection = "None";
	strFormat = "";
	strDefault = "";
	strDefaultFormula = String.Empty;
	fDefaultFormulaEmpty = true;
	strDefaultURLDesc = "";
	iMaxLength = int.MaxValue;
	iNumLines = int.MaxValue;
	dblMin = double.MinValue;
	dblMax = double.MaxValue;
	strDecimals = "";
	bPercentage = false;
	bRichText = false;
	bDisableRichTextModeControl = false;
	RichTextMode = SPRichTextMode.FullHtml;
	bAllowHyperlink = false;
	bAppendOnly = false;
	strFromBaseType = "";
	strLookupList = "";
	strLookupField = "";
	strShowPresence = "";
	strDisplaySize = "";
	strDisplayNameParam = "";
	bShowIME = RegionalSettings.IsEastAsia;
	bShowBidiDirection = RegionalSettings.IsRightToLeft;
	bShowCalendarUI = (RegionalSettings.CalendarType != 1);
	iWebCalType = (int) RegionalSettings.CalendarType;
	iCalType = iWebCalType;
	bUseDefault = true;
	strCalType = "";
	strChoiceTextArea ="";
	strGridChoiceTextArea ="";
	GridStartNum = 1;
	GridEndNum = 5;
	strGridTxtRng1 = "";
	strGridTxtRng2 = "";
	strGridTxtRng3 = "";
	strGridNATxt = "";
	strIMEMode = "";
	strFillInChoice = "";
	strResultType = "";
	strFormula = "";
	spDefaultView = spList == null ? null : spList.DefaultView;
	strHiddenSchema = "";
	strCheckedLiteral = " checked=\"checked\" ";
	strFriendlyFormat = "Disabled";
	bPrevDeniedState = SPSecurity.CatchAccessDeniedException;
	strDisableRequired = "";
	strDisableEnforceUniqueValues = "";
if (strListId == null)
{
	string customGroup = SPResource.GetString(Strings.CustomColumnsGroup);
	ContentTypePageUtil.FetchFieldGroups(
		Web.AvailableFields,
		SelectExistingGroupName,
		customGroup,
		null);
}
if (strListId == null)
{
	string defaultGroup = Request.QueryString.Get("GroupNameParam");
	if (defaultGroup != null)
		defaultGroup.Trim();
	if (defaultGroup != null && defaultGroup.Length > 0)
	{
		ListItem item = SelectExistingGroupName.Items.FindByValue(defaultGroup);
		if (item != null)
		{
			SelectExistingGroupName.Value = defaultGroup;
		}
		else
		{
			RadNewGroup.Checked = true;
			TxtNewGroupName.Value = defaultGroup;
		}
	}
}
if ( Request.Url.ToString().IndexOf("DisplayNameParam") != -1 )
{ strDisplayName = Request.QueryString.GetValues("DisplayNameParam")[0]; }
if ( Request.Url.ToString().IndexOf("DescriptionParam") != -1 )
{ strDescription  = Request.QueryString.GetValues("DescriptionParam")[0];}
if ( Request.Url.ToString().IndexOf("FieldTypeParam") != -1 )
{
  strFieldTypeParam =  Request.QueryString.GetValues("FieldTypeParam")[0];
  FieldTypeName = strFieldTypeParam;
}
if ( Request.Url.ToString().IndexOf("LookupListParam") != -1 )
{strLookupList   =  Request.QueryString.GetValues("LookupListParam")[0] ; }
if ( Request.Url.ToString().IndexOf("LookupFieldParam") != -1 )
{strLookupField  =  Request.QueryString.GetValues("LookupFieldParam")[0]; }
if ( Request.Url.ToString().IndexOf("ShowPresence") != -1 )
{strShowPresence  =  Request.QueryString.GetValues("ShowPresence")[0]; }
if ( Request.Url.ToString().IndexOf("VldFormulaParam") != -1 )
{ VldFormula.Text = Request.QueryString.GetValues("VldFormulaParam")[0]; }
if ( Request.Url.ToString().IndexOf("VldMessageParam") != -1 )
{ VldMessage.Text = Request.QueryString.GetValues("VldMessageParam")[0]; }
if (FieldTypeName == "")
{
	FieldTypeName = "Choice";
}
if (FieldTypeName == "PageSeparator")
{
	strDisplayName = (string)(this.GetGlobalResourceObject("wss", "fldnew_PageSeparator_DisplayName"));
}
else
{
	String tDisplayNameParam = "";
	if ( Request.Url.ToString().IndexOf("DisplayNameParam") != -1 )
	{ tDisplayNameParam = Request.QueryString.GetValues("DisplayNameParam")[0]; }
	switch ( tDisplayNameParam )
	{    case "":
			String L_strDisplayName_Text = (string)(this.GetGlobalResourceObject("wss", "fldedit_typeyourquestion"));
			strDisplayName =L_strDisplayName_Text ;
			break;
	}
}
if ( Request.Url.ToString().IndexOf("CalType") != -1 )
{
	strCalType  =  Request.QueryString.GetValues("CalType")[0];
	if (strCalType != "")
	{
		iCalType = Convert.ToInt32(strCalType);
		if (iCalType > 0)
			bUseDefault = false;
		else if(iCalType == 0)
		{
			bUseDefault = true;
			iCalType = iWebCalType;
		}
	}
}
L_strAutoIndexConfirm_Text =
	SPHttpUtility.EcmaScriptStringLiteralEncode(SPResource.GetString(Strings.EnforceUniqueValuesAutoIndex));
switch(FieldTypeName)
{
	  case "Text":
		if (iMaxLength == int.MaxValue)
			iMaxLength    = 255;
		break;
	  case "Note":
		if (iNumLines == int.MaxValue)
			iNumLines     = 6;
		break;
	case "Choice":
		strFormat = "RadioButtons";
		strFillInChoice = "FALSE";
		break;
	case "MultiChoice":
		FieldTypeName = "Choice";
		strFormat = "Checkboxes";
		strFillInChoice = "FALSE";
		break;
	case "DateTime":
		strFormat = "DateOnly";
		break;
	case "Calculated":
		strResultType = "Text";
		strFormula    = "";
		strFormat     = "DateOnly";
		CurrencyLocaleId = Web.CurrencyLocaleID;
		break;
	case "Currency":
		CurrencyLocaleId = Web.CurrencyLocaleID;
		break;
}
%>
<SharePoint:ScriptBlock runat="server" WriteEnabled="true">
var formTabIndex = -1;
var elemVldSection;
var elemVldSettings;
var elemVldImg;
var elemVldFormula;
var elemVldMessage;
function Hide(element)
{
	if (element == null)
		return;
	if(element.style.display != "none")
	{
		element.style.display = "none";
	}
 }
 function Show(element)
 {
	if (element == null)
		return;
		element.style.display = "";
}
function ShowColumnFormat(type)
{
	if (type == null || type == "" )
		return;
	Hide(document.getElementById("divDecimalID"));
	Hide(document.getElementById("divPercentageID"));
	Hide(document.getElementById("divCurrencylID"));
	Hide(document.getElementById("divDateTimelID"));
	Hide(document.getElementById("divCalendarID"));
	switch(type)
	{
		case "Number":
			Show(document.getElementById("divDecimalID"));
			Show(document.getElementById("divPercentageID"));
		break
		case "Currency":
			Show(document.getElementById("divDecimalID"));
			Show(document.getElementById("divCurrencylID"));
		break;
		case "DateTime":
			Show(document.getElementById("divDateTimelID"));
			Show(document.getElementById("divCalendarID"));
		break;
	}
}
function BodyOnLoad()
{
	try{window.focus();}catch(e){}
	siteReadOnly = false;
	<% if (Site != null && Site.ReadOnly) { %>
		siteReadOnly = true;
	<% } %>
	var btnOk = document.getElementById("onetidSaveItem");
	if (btnOk != null)
		btnOk.disabled = siteReadOnly;
	<% if (strFieldTypeParam == "") {%>
	try
	{
		document.forms[MSOWebPartPageFormName].DisplayName.select();
		document.forms[MSOWebPartPageFormName].DisplayName.focus();
	}
	catch(e)
	{
	}
	<%} else {%>
	var type = document.forms[MSOWebPartPageFormName].Type;
	for (i = 0; i < type.length; i ++ ) {
		if (type[i].checked) {
			try
			{
				type[i].select();
				type[i].focus();
			}
			catch(e)
			{
			}
		}
	}
	<%}%>
	ShowColumnFormat(<%SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(strResultType),this.Page);%>);
	initValidationPageElements();
	initEnforceUniqueValuesValidationRow();
	InitGroup();
}
function showFillinSection()
{
}
function showValidationSection()
{
	if (GetRadioButtonValue(document.forms[MSOWebPartPageFormName].Format) != "Checkboxes")
	{
		Show(elemVldSection);
		if (isValidationPresent())
		{
			showValidationSettings(true);
		}
	}
	else
	{
		Hide(elemVldSection);
		showValidationSettings(false);
	}
}
function disableUniquenessIfMultiChoice()
{
	var frmFormat = document.forms[MSOWebPartPageFormName].Format;
	if (frmFormat != null && typeof(frmFormat) != "undefined")
	{
		var allowMultiValChecked = (GetRadioButtonValue(frmFormat) == "Checkboxes");
		var radEnforceUniqueValuesYes = document.getElementById("onetidEnforceUniqueValuesTrue");
		var radEnforceUniqueValuesNo = document.getElementById("onetidEnforceUniqueValuesFalse");
		if (radEnforceUniqueValuesYes != null)
		{
			if (allowMultiValChecked)
			{
				radEnforceUniqueValuesYes.checked = false;
				radEnforceUniqueValuesNo.checked = true;
				radEnforceUniqueValuesYes.disabled = true;
				radEnforceUniqueValuesNo.disabled = true;
			}
			else
			{
				radEnforceUniqueValuesYes.disabled = false;
				radEnforceUniqueValuesNo.disabled = false;
			}
		}
	}
}
function toggleValidationSettings()
{
	showValidationSettings(elemVldSettings.style.display == "none");
}
function showValidationSettings(bVisible)
{
	if (bVisible)
	{
		elemVldSettings.style.display = "";
		elemVldImg.src = "/_layouts/15/images/minus.gif?rev=40";
	}
	else
	{
		elemVldSettings.style.display = "none";
		elemVldImg.src = "/_layouts/15/images/plus.gif?rev=40";
	}
}
function isValidationPresent()
{
	return elemVldFormula.value != "" || elemVldMessage.value != "";
}
function initValidationPageElements()
{
	elemVldSection  = document.getElementById("ValidationSection");
	elemVldSettings = document.getElementById("ValidationSettings");
	elemVldImg = document.getElementById("ValidationImg");
	elemVldFormula = document.getElementById(<%SPHttpUtility.WriteAddQuote(SPHttpUtility.NoEncode(VldFormula.ClientID),this.Page);%>);
	elemVldMessage = document.getElementById(<%SPHttpUtility.WriteAddQuote(SPHttpUtility.NoEncode(VldMessage.ClientID),this.Page);%>);
	if (elemVldSettings && elemVldSettings.style.display == "none" && isValidationPresent())
	{
		showValidationSettings(true);
	}
}
var g_bShowingEnforceUniqueValuesRow = false;
function initEnforceUniqueValuesValidationRow()
{
	var elmEnforceUniqueValuesControl = document.getElementById("onetidEnforceUniqueValuesTrue");
	if (elmEnforceUniqueValuesControl != null)
	{
	<%
		string validationMessage;
		if (ShouldShowEnforceUniqueValuesValidationWarning(out validationMessage))
		{
	%>
		var validationText = <%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(validationMessage),this.Page);%>
		var elmEnforceUniqueValuesValidationText = document.getElementById("enforceUniqueValuesValidationText");
		if (browseris.ie)
		{
			elmEnforceUniqueValuesValidationText.innerText = validationText;
		}
		else
		{
			elmEnforceUniqueValuesValidationText.textContent = validationText;
		}
	g_bShowingEnforceUniqueValuesRow = true;
	<%
		}
	%>
	}
}
function showEnforceUniqueValuesValidationRow()
{
	var elmEnforceUniqueValuesValidationText = document.getElementById("enforceUniqueValuesValidationText");
	if (elmEnforceUniqueValuesValidationText != null &&
		g_bShowingEnforceUniqueValuesRow == true)
	{
		elmEnforceUniqueValuesValidationText.style.display = "block";
	}
}
function InitGroup()
{
	var o = document.getElementById("<%=RadExistingGroup.ClientID%>");
	if (o == null)
		return;
	HandleGroupClick(o.checked);
}
function HandleGroupClick(fExistingGroup)
{
	var o = document.getElementById("<%=RadExistingGroup.ClientID%>");
	if (o == null)
		return;
	if (fExistingGroup)
	{
		document.getElementById("<%=SelectExistingGroupName.ClientID%>").disabled = false;
		document.getElementById("<%=TxtNewGroupName.ClientID%>").disabled = true;
	}
	else
	{
		document.getElementById("<%=SelectExistingGroupName.ClientID%>").disabled = true;
		document.getElementById("<%=TxtNewGroupName.ClientID%>").disabled = false;
	}
}
function GetGroupName()
{
	var o = document.getElementById("<%=RadExistingGroup.ClientID%>");
	if (o == null)
		return "";
	var groupName;
	if (o.checked)
	{
		groupName = document.getElementById("<%= SelectExistingGroupName.ClientID %>").value;
	}
	else
	{
		groupName = document.getElementById("<%= TxtNewGroupName.ClientID %>").value;
	}
	return TrimSpaces(groupName);
}
function ConfirmFieldDelete(columnType, isReferentialIntegrityColumn)
{
	if (columnType == 12)
	{
		alert("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_columninusewarning%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
		return false;
	}
	else if (columnType == 11)
	{
		return confirm("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_deleteconfirm_web%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
	}
	else if (columnType == 2)
	{
		return confirm("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_questiondelwarning%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
	}
	else if (columnType == 3)
	{
		 if (isReferentialIntegrityColumn)
		 {
			 return confirm("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_deleteconfirm_homogenous_isRILookup_list%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
		 }
		 else
		 {
			  return confirm("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_deleteconfirm_homogenous_list%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
		 }
	}
	else if (columnType == 5)
	{
		return true;
	}
	else if (columnType == 4)
	{
		if (isReferentialIntegrityColumn)
		{
			 return confirm("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_deleteconfirm_heterogenous_isRILookup_list%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
		}
		else
		{
			return confirm("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_deleteconfirm_heterogenous_list%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
		}
	}
	else
	{
		return true;
	}
}
</SharePoint:ScriptBlock>
<SharePoint:ScriptBlock runat="server" WriteEnabled="true">
var helperFrm = new OWSForm(MSOWebPartPageFormName, true, <%SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(SPUtility.GetWebLayoutsFolder(Web)),this.Page);%>);
helperFrm.stFieldPrefix = "";
helperFrm.dopt.chDateSep = <% SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(SPControl.GetContextWeb(Context).RegionalSettings.DateSeparator),this.Page); %> ; helperFrm.dopt.chTimeSep = <% SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(SPControl.GetContextWeb(Context).RegionalSettings.TimeSeparator),this.Page); %> ; <%if(SPControl.GetContextWeb(Context).RegionalSettings.Time24) {%> helperFrm.dopt.SetTimeFormat(1); <%} else {%> helperFrm.dopt.SetTimeFormat(0); <%}%> helperFrm.dopt.SetDateOrder( <% SPHttpUtility.WriteEcmaScriptStringLiteralEncode(SPControl.GetContextWeb(Context).RegionalSettings.DateFormat.ToString(),this.Page); %> ); helperFrm.dopt.SetDOW( <% SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(SPControl.GetContextWeb(Context).RegionalSettings.FirstDayOfWeek.ToString()),this.Page); %> ); helperFrm.dopt.stAM = <% SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(SPControl.GetContextWeb(Context).RegionalSettings.AM),this.Page); %>; helperFrm.dopt.stPM = <% SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(SPControl.GetContextWeb(Context).RegionalSettings.PM),this.Page); %>; helperFrm.dopt.TimeMarkPosn = <% SPHttpUtility.WriteEcmaScriptStringLiteralEncode(SPControl.GetContextWeb(Context).RegionalSettings.TimeMarkerPosition.ToString(),this.Page); %> ; helperFrm.dopt.webTZOffsetMin = <% SPHttpUtility.WriteEcmaScriptStringLiteralEncode(SPControl.GetContextWeb(Context).RegionalSettings.TimeZone.Information.Bias.ToString(),this.Page); %> ;
helperFrm.nopt.chDigSep = <% SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(SPControl.GetContextWeb(Context).RegionalSettings.ThousandSeparator),this.Page); %>; helperFrm.nopt.chDecimal = <% SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(SPControl.GetContextWeb(Context).RegionalSettings.DecimalSeparator),this.Page); %>; helperFrm.nopt.chMinus = <% SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(SPControl.GetContextWeb(Context).RegionalSettings.NegativeSign),this.Page); %>; helperFrm.nopt.iNegNumber = <% SPHttpUtility.WriteEcmaScriptStringLiteralEncode(SPControl.GetContextWeb(Context).RegionalSettings.NegNumberMode.ToString(),this.Page); %>; helperFrm.nopt.SetGrouping = (<% SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(SPControl.GetContextWeb(Context).RegionalSettings.DigitGrouping),this.Page); %>);
</SharePoint:ScriptBlock>
<%  %>
<SharePoint:ScriptBlock runat="server" WriteEnabled="true">
var bInaccessibleList = false;
	var L_alert1_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert1_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert4_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert4_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert5_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert5_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert7_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert7_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert6_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert6_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert9_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert9_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert8_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert8_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert10_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert10_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert11_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert11_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert12_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert12_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert13_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert13_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert14_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert14_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert15_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert15_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert16_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert16_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert17_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert17_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert18_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert18_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert19_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert19_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert19A_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert19A_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert20_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert20_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert22_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert22_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert23_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert23_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert24_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert24_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert25_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert25_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert26_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert26_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	var L_alert28_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_alert28_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
	function GetTypeDesc(type)
	{
		var L_TypeCounter_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeCounter_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypeSingleLine_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeSingleLine_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypeMultiLine_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeMultiLine_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypeNumber_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeNumber_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypeCurrency_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeCurrency_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypeDateTime_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeDateTime_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypeChoice_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeChoice_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypeMultiChoice_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeMultiChoice_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypeGridChoice_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeGridChoice_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypePageSeparator_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypePageSeparator_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypeBool_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeBool_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypeLookup_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeLookup_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypeUser_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeUser_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypeURL_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeURL_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypeComputed_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeComputed_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		var L_TypeUnkown_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_TypeUnkown_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		switch (type)
		{
			case "Text": return L_TypeSingleLine_Text;
			case "Note": return L_TypeMultiLine_Text;
			case "Number": return L_TypeNumber_Text;
			case "Currency": return L_TypeCurrency_Text;
			case "DateTime": return L_TypeDateTime_Text;
			case "Choice": return L_TypeChoice_Text;
			case "MultiChoice": return L_TypeMultiChoice_Text;
			case "GridChoice": return L_TypeGridChoice_Text;
			case "PageSeparator": return L_TypePageSeparator_Text;
			case "Boolean": return L_TypeBool_Text;
			case "Lookup": return L_TypeLookup_Text;
			case "User": return L_TypeUser_Text;
			case "URL": return L_TypeURL_Text;
			case "Computed": return L_TypeComputed_Text;
		}
		return L_TypeUnkown_Text;
	}
	function DoDelete(){
		<% if (spList == null) { %>
			var deleteType = 11;
			if (document.frmSubmit.FieldInUse.value > 0)
				deleteType = 12;
		<% } else { %>
			var deleteType = 2;
			<% if (spField is SPFieldPageSeparator) { %>
				deleteType = 5;
			<% } %>
		<% } %>
		if (ConfirmFieldDelete(deleteType))
		{
			var form = document.forms[0];
			var bUseFieldId = false;
			<%if (string.IsNullOrEmpty(strField)) {%>
				bUseFieldId = true;
			<% } %>
			var strFieldRef;
			if (bUseFieldId)
				strFieldRef = "&FieldId=" + <%SPHttpUtility.WriteAddQuote(SPHttpUtility.UrlKeyValueEncode(strFieldId),this.Page);%>;
			else
				strFieldRef = "&Field=" + <%SPHttpUtility.WriteAddQuote(SPHttpUtility.UrlKeyValueEncode(strField),this.Page);%>;
			form.action = <%SPHttpUtility.WriteAddQuote(SPHttpUtility.UrlPathEncode(strHttpPath,true),this.Page);%> +
									"&Cmd=DeleteField&" +
									"<%=strContainerParam%>" +
									strFieldRef +
									"&owshiddenversion=" +
									<%SPHttpUtility.WriteAddQuote(SPHttpUtility.NoEncode(Version),this.Page);%> +
									"&NextUsing=" +
									<%SPHttpUtility.WriteAddQuote(SPHttpUtility.UrlKeyValueEncode(strNextUsing),this.Page);%>;
			if (null ==  form.__PREVIOUSPAGE)
			{
				var inputTag = document.createElement("input");
				inputTag.setAttribute("type", "hidden");
				inputTag.setAttribute("name", "__PREVIOUSPAGE");
				form.__VIEWSTATE.parentNode.appendChild(inputTag);
			}
			form.__PREVIOUSPAGE.value = window.location.href ;
			form.__VIEWSTATE.value = "";
			form.method="POST";
			form.submit();
		}
		return false;
	}
	function GetFieldType() {
		var type = document.forms[MSOWebPartPageFormName].Type;
		if (type.length) {
			for (i = 0; i < type.length; i ++ ) {
				if (type[i].checked) {
					return type[i].value;
				}
			}
		} else {
			if (type.checked) {
				return type.value;
			}
		}
		return "";
	}
	function GetRadioButtonValue (frmElem) {
		for (i = 0; i < frmElem.length; i++ ) {
			if (frmElem[i].checked) {
				return frmElem[i].value;
			}
		}
	return "";
	}
	function GetLookupList () {
		var listSel = document.forms[MSOWebPartPageFormName].LookupList;
		return GetSelectedValue(listSel);
	}
	function GetLookupField () {
		var fieldSel = document.forms[MSOWebPartPageFormName].LookupField;
		return GetSelectedValue(fieldSel);
	}
	function GetShowPresence () {
		var presSel = document.forms[MSOWebPartPageFormName].ShowPresence;
		return !presSel || presSel.checked ? "" : "FALSE";
	}
	function Selected(sCurList, sName){
		if (sCurList==sName) {
			return " selected";
		}
		return "";
	}
	function ConfirmSelectingUnlimitedLengthInDocumentLibrary()
	{
		var warningMsg = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_WarningForUnlimitedLengthInDocumentLibrar%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
		if (!confirm(warningMsg))
		{
			var frm = document.forms[MSOWebPartPageFormName];
			frm.UnlimitedLengthInDocumentLibrary[0].checked = false;
			frm.UnlimitedLengthInDocumentLibrary[1].checked = true;
		}
	}
	function UpdatePage(typeVal, bUseFldNewExPage) {
		var sLookup = "Lookup";
		var sUser = "User";
		var sLLArg = "&LookupListParam=";
		var sLLVal = "";
		var sPresArg = "&ShowPresence=";
		var sPresVal = "";
		var sURL = ajaxNavigate.get_href();
		var nameval = escapeProperly(document.forms[MSOWebPartPageFormName].DisplayName.value);
		var sDescriptionArg = "";
		var descval = "";
		var btnOk = document.getElementById("onetidSaveItem");
		if (btnOk != null)
			btnOk.disabled = true;
		if (typeVal == sLookup) {
			sLLVal = GetLookupList();
			if (sLLVal.length != 0)
				sLLVal = sLLArg + sLLVal;
		}
		if ((typeVal == sUser) || (typeVal == sLookup)) {
			sPresVal = GetShowPresence();
			if (sPresVal.length != 0)
				sPresVal = sPresArg + sPresVal;
		}
<%
		if (spList == null)
		{
%>
		var sGroupNameArg = "&GroupNameParam=";
		var groupval = escapeProperly(GetGroupName());
<%
		}
		else
		{
%>
		var sGroupNameArg = "";
		var groupval = "";
<%
		}
%>
		if (bUseFldNewExPage)
			sURL = sURL.replace(/qstnew.aspx/gi, "FldNewEx.aspx");
		var sNewUrl;
		sNewUrl = StURLSetVar2(sURL, "FieldTypeParam", typeVal);
		sNewUrl = StURLSetVar2(sNewUrl, "DisplayNameParam", nameval);
		if (sDescriptionArg.length > 0)
			sNewUrl = StURLSetVar2(sNewUrl, "DescriptionParam", descval);
		if (sGroupNameArg.length > 0)
			sNewUrl = StURLSetVar2(sNewUrl, "GroupNameParam", groupval);
		if (elemVldFormula)
			sNewUrl = StURLSetVar2(sNewUrl, "VldFormulaParam", escapeProperly(elemVldFormula.value));
		if (elemVldMessage)
			sNewUrl = StURLSetVar2(sNewUrl, "VldMessageParam", escapeProperly(elemVldMessage.value));
		sNewUrl = sNewUrl + sLLVal + sPresVal;
		if (sNewUrl.length > 2040)
		{
			sNewUrl = StURLSetVar2(sURL, "FieldTypeParam", typeVal) + sLLVal;
		}
		STSNavigate(sNewUrl);
		return true;
	}
	function UpdateDateField() {
		var sArg = "&FieldTypeParam=";
		var sFieldNameArg = "&DisplayNameParam=";
		var sURL = ajaxNavigate.get_href();
		var sCalVal = "";
		var nameval = escapeProperly(document.forms[MSOWebPartPageFormName].DisplayName.value);
		var sDescriptionArg = "";
		var descval = "";
		var dwArgPos = sURL.indexOf(sArg);
		if (dwArgPos!=-1) {
			sURL = sURL.substr(0,dwArgPos);
		}
		if(document.forms[MSOWebPartPageFormName].RadioCalType[1].checked)
		{
			if (document.forms[MSOWebPartPageFormName].CalType)
				sCalVal = GetSelectedValue(document.forms[MSOWebPartPageFormName].CalType);
			if (sCalVal.length != 0)
				sCalVal = "&CalType=" + sCalVal;
			else
				sCalVal = "";
		}
		else
			sCalVal = "&CalType=0";
		var sNewUrl = sURL + sArg + "DateTime" + sFieldNameArg + nameval + sDescriptionArg + descval + sCalVal;
		if (sNewUrl.length > 2040)
		{
			sNewUrl = sURL + sArg + "DateTime" + sCalVal;
		}
		STSNavigate(sNewUrl);
	}
	function SimpleHTMLEncode( str )
	{
		var re;
		str = str.toString();
		re = /&/g;
		str = str.replace(re, "&amp;");
		re = /</g;
		str = str.replace(re, "&lt;");
		re = />/g;
		str = str.replace(re, "&gt;");
		re = /\"/g;
		str = str.replace(re, "&quot;");
		re = /\'/g;
		str = str.replace(re, "&apos;");
		return str;
	}
	function SimpleHTMLEncodeMultiLine(str)
	{
		var re;
		str = SimpleHTMLEncode(str);
		re = /\r/g;
		str = str.replace(re, "&#xD;");
		re = /\n/g;
		str = str.replace(re, "&#xA;");
		return str;
	}
	function CheckForIllegals( str, bValidationFormula )
	{
		if (str != null &&
			str != String.Empty &&
			str != "" &&
			str != "=")
		{
			return true;
		}
		if (bValidationFormula)
		{
			alert(L_alert28_Text);
			elemVldFormula.focus();
		}
		else
		{
			alert(L_alert18_Text);
			document.forms[MSOWebPartPageFormName].Formula.focus();
		}
		return false;
	}
	function SubmitButtonOnClick(btn)
	{
		if (Boolean(btn))
			btn.disabled = true;
		setTimeout(function(){
			var imgProg = document.getElementById("ImageProgress");
			if (Boolean(imgProg))
			{
				imgProg.style.display='';
			}}, 1000);
	}
	function SubmitPage(fAddMore, btn) {
		if(bInaccessibleList){
		   alert(L_alert24_Text);
		   return;
		}
		var formSubmit  = document.forms.frmSubmit;
		var pageCommand = "Cmd=NewField";
		var formAction  = <%SPHttpUtility.WriteAddQuote(SPHttpUtility.UrlPathEncode(strHttpPath,true),this.Page);%> +
									"&" + pageCommand + "&" +
									"<%=strContainerParam%>";
		if (fAddMore)
		{
<%
			string addNewQuestionUrl = SPUtility.GetWebLayoutsFolder(Web) + "qstNew.aspx?List=" + SPHttpUtility.UrlKeyValueEncode(spList.ID);
			addNewQuestionUrl = SPHttpUtility.UrlPathEncode(addNewQuestionUrl, false);
%>
			formSubmit.action = formAction + "&NextUsing=" +
				(<%SPHttpUtility.WriteAddQuote(SPHttpUtility.UrlKeyValueEncode(addNewQuestionUrl),this.Page);%>).replace("%2F%5Flayouts%2F15%2F", "%2F%5Flayouts%2F15%2FXnet%2ESP%2EKolektor%2FForms%2FQuickPoll%2F");
		}
		else
		{
			formSubmit.action = formAction + "&NextUsing=" +
				(<%SPHttpUtility.WriteAddQuote(SPHttpUtility.UrlKeyValueEncode(strNextUsing),this.Page);%>).replace("%2F%5Flayouts%2F15%2F", "%2F%5Flayouts%2F15%2FXnet%2ESP%2EKolektor%2FForms%2FQuickPoll%2F");
			<% if (Context.Request.QueryString["IsDlg"] != null)
			{
			%>
				formSubmit.action = formSubmit.action + "&IsDlg=1";
			<%
			}
			%>
		}
		<%
		string viewId = Request.QueryString.Get("AddToView");
		Guid viewGuid;
		if (Guid.TryParse(viewId, out viewGuid))
		{
			string viewGuidString = SPHttpUtility.UrlKeyValueEncode(viewGuid.ToString());
			%>
			formSubmit.action += "&AddToView=<%=viewGuidString%>";
			<%
		}
		%>
		var frm         = document.forms[MSOWebPartPageFormName];
		var Name        = TrimSpaces( frm.Name.value        );
		var DisplayName = TrimSpaces( frm.DisplayName.value );
<%
	if (bShowIME && !bSealed)
	{
		if (FieldTypeName !="Lookup" && FieldTypeName != "DateTime" && FieldTypeName != "GridChoice"
			&& FieldTypeName != "Calculated" && FieldTypeName != "Number"
			&& FieldTypeName != "Currency" && FieldTypeName != "User" && FieldTypeName != "Boolean"
			&& !(FieldTypeName == "Note" && bRichText == true) && FieldTypeName !="PageSeparator")
		{
%>
		var IMEMode     = frm.IMEMode ? GetSelectedValue(frm.IMEMode) : "";
<%      } else { %>
		var IMEMode     = "inactive";
<%      }
	} %>
		if (DisplayName.length < 1)
		{
			 alert(L_alert1_Text);
			 frm.DisplayName.focus();
			 return false;
		}
		var GroupName;
<%
if (spList == null)
{
%>
		GroupName = GetGroupName();
		if (GroupName.length < 1)
		{
			alert("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_group_name_required%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
			return false;
		}
		if (GroupName.length > 128)
		{
			alert("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_group_name_invalid%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
			return false;
		}
<%
}
%>
		{
			var FromBaseType= "";
			var DisplaySize = "";
			var Type        = GetFieldType();
			if (Type == "")
			{
				alert("<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,ctypedit_fieldtypemissing_error%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>");
				return;
			}
			if (-1 != DisplayName.indexOf("[") ||
				-1 != DisplayName.indexOf("]"))
			{
				alert(L_alert17_Text);
				frm.DisplayName.focus();
				return false;
			}
			if (Type == "PageSeparator")
			{
				count = 0;
				do
				{
					count++;
					tempDisplayName = DisplayName + " " + count;
				}
				while(doesFieldNameConflict(tempDisplayName))
				DisplayName = tempDisplayName;
			}
			else
			{
				if (doesFieldNameConflict(DisplayName))
				{
					alert(L_alert16_Text);
					frm.DisplayName.focus();
					return false;
				}
			}
<%
if (!bSealed)
{
%>
			if (! helperFrm.FValidate(true))
				return false;
		   if (Type=="Boolean" || Type=="Calculated" || Type=="PageSeparator")
		   {
				var Required    = "";
			}
			else {
				var Required;
				if (frm.Required != null)
					Required = frm.Required[0].checked ? "TRUE" : "FALSE";
				else
					Required = <% if ( bRequired ) { %>"TRUE"<%; } else {%> "FALSE" <%;}%>;
			}
			var EnforceUniqueValues = "";
			if (frm.EnforceUniqueValues != null)
				EnforceUniqueValues = frm.EnforceUniqueValues[0].checked ? "TRUE" : "FALSE";
			else
				EnforceUniqueValues = <% if ( bEnforceUniqueValues ) { %>"TRUE"<%; } else {%> "FALSE" <%;}%>;
			var Indexed = <% if (bIndexed) {  %>"TRUE"<%; } else {%> "FALSE" <%;}%>;
		<% if (!bIndexed) { %>
				if (EnforceUniqueValues == "TRUE")
				{
					if (!confirm(<%SPHttpUtility.WriteNoEncode("'" + L_strAutoIndexConfirm_Text + "'",this.Page);%>)) return false;
					Indexed = "TRUE";
				}
			<% } %>
			var UnlimitedLengthInDocumentLibrary = "";
<%if (SPBaseType.DocumentLibrary == iBaseType || spList == null) { %>
			if (Type=="Note")
			{
				UnlimitedLengthInDocumentLibrary =
					frm.UnlimitedLengthInDocumentLibrary[0].checked ? "TRUE" : "";
			}
<%}%>
			if (Type=="Lookup" || Type=="User") {
				var LookupList  = GetLookupList();
				var LookupField = TrimSpaces( GetLookupField() );
				var ShowPresence= GetShowPresence();
				if (LookupList == "UserInfo")
				{
					Type = "User";
				}
				else
				{
					Type = "Lookup";
				}
			}
			var FillInChoice = "";
			if (Type=="Choice") {
				var Format      = frm.Format     ? GetRadioButtonValue(frm.Format) : "";
				FillInChoice    = frm.FillInChoice ? GetRadioButtonValue(frm.FillInChoice) : "";
			}
			else if (Type=="DateTime" || Type=="Calculated"){
				var Format    = frm.Format[0].checked ? "DateOnly" : "DateTime";
			}
			else {
				var Format      = frm.Format     ? GetSelectedValue(frm.Format)      : "";
			}
			if (Type=="Boolean") {
				var Default     = frm.Default    ? GetSelectedValue(frm.Default) : "";
			}
			else if (Type=="DateTime") {
				var Default = "";
				if (frm.Default) {
<%                if (IsPreviewableCalType(iCalType))
				  {
%>
					if (frm.Default[3].checked)
					{
						var DefaultFormula = frm.DefaultFormula    ? TrimSpaces(frm.DefaultFormula.value): "";
					}
					else if (frm.Default[2].checked)
					{
						if (g_fld.date)
							Default = DateOptions.StISODate(g_fld.date);
						else {
							frm.Default[0].checked = true;
							Default =  frm.Default[0].value;
						}
					} else
						Default =  GetRadioButtonValue(frm.Default);
<%                }
				  else
				  {
%>
					if (frm.Default[2].checked)
					{
						var DefaultFormula = frm.DefaultFormula    ? TrimSpaces(frm.DefaultFormula.value): "";
					} else
						Default =  GetRadioButtonValue(frm.Default);
<%                }
%>
				}
				if (frm.FriendlyFormat)
				{
					if (frm.FriendlyFormat[0].checked)
					{
						var FriendlyFormat = frm.FriendlyFormat[0].value;
					}
					else if (frm.FriendlyFormat[1].checked)
					{
						var FriendlyFormat = frm.FriendlyFormat[1].value;
					}
				}
			}
			else {
			if (frm.Default && frm.Default[1])
			{
				if (frm.Default[1].checked)
				{
					var DefaultFormula = frm.DefaultText ? TrimSpaces(frm.DefaultText.value): "";
					var Default     = "";
				}
				else
				{
					var Default     = frm.DefaultText ? TrimSpaces(frm.DefaultText.value): "";
				}
			}
			else
					var Default     = frm.Default ? TrimSpaces(frm.Default.value): "";
			}
			var L_GridLow_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_GridLow_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
			var L_GridAverage_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_GridAverage_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
			var L_GridHigh_Text = "<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_GridHigh_Text%>' EncodeMethod='EcmaScriptStringLiteralEncode'/>";
			var GridChoices = frm.GridChoices ? frm.GridChoices.value  : "";
			var GridStartNum= frm.GridNumRange ? 1 : "";
			var GridEndNum  = frm.GridNumRange ? frm.GridNumRange.selectedIndex + 3 : "";
			var GridTxtRng1 = frm.GridTxtRng1 ? frm.GridTxtRng1.value : "";
			var GridTxtRng2 = frm.GridTxtRng2 ? frm.GridTxtRng2.value : "";
			var GridTxtRng3 = frm.GridTxtRng3 ? frm.GridTxtRng3.value : "";
			var GridNATxt   = frm.GridNATxt ? frm.GridNATxt.value : "";
			var Description = frm.Description ? TrimSpaces( frm.Description.value ): "";
			var NumLines    = frm.NumLines    ? frm.NumLines.value : "";
			var MaxLength   = frm.MaxLength   ? frm.MaxLength.value : "";
			var Choices     = frm.Choices     ? frm.Choices.value  : "";
			var radioPushdown = document.getElementById("RadPushDownYes");
			var PushDown = (radioPushdown != null && radioPushdown.checked) ? "1" : "";
			var AddToDefVw  = "ON";
			var AddToAllContentTypes = 'NO';
			var Min         = frm.Min        ? frm.Min.value : "";
			var Max         = frm.Max        ? frm.Max.value : "";
			var Decimals    = frm.Decimals   ? TrimSpaces( GetSelectedValue(frm.Decimals) ): "";
			var Percentage  = frm.Percentage ? (frm.Percentage.checked==1 ? "TRUE" : "") : "";
			var RichText = "";
			var RichTextMode = "";
			if (frm.RichText)
			{
				if (frm.RichText[0].checked)
				{
					RichText = "FALSE";
					RichTextMode = "";
				}
				if (frm.RichText[1].checked)
				{
					RichText = "TRUE";
					if (frm.RichText.length > 2)
						RichTextMode = "Compatible";
					else
						RichTextMode = "FullHtml";
				}
				if (frm.RichText.length > 2 && frm.RichText[2].checked)
				{
					RichText = "TRUE";
					RichTextMode = "FullHtml";
				}
			}
			var AllowHyperlink = frm.AllowHyperlink ? "TRUE" : "";
			var AppendOnly  = frm.AppendOnly ? (frm.AppendOnly[0].checked==1 ? "TRUE" : "") : "";
			var CurrencyInput = frm.<% SPHttpUtility.WriteEcmaScriptStringLiteralEncode(CurrencyFormInputName,this.Page); %>;
			var LCID        = CurrencyInput ? GetSelectedValue(CurrencyInput) : "";
			var CalType     = frm.RadioCalType ? (frm.RadioCalType[1].checked  ? (frm.CalType  ?    GetSelectedValue(frm.CalType) : "") : "") : "";
			var Direction   = frm.Direction  ?             GetSelectedValue(frm.Direction) : "";
			var DefaultURLDesc = frm.DefaultURLDesc ? TrimSpaces(frm.DefaultURLDesc.value): "";
			var ResultType  = frm.ResultType ? TrimSpaces( GetRadioButtonValue(frm.ResultType) ): "";
			var Formula     = frm.Formula    ? TrimSpaces(frm.Formula.value) : "";
			var VldFormula  = elemVldFormula ? TrimSpaces(elemVldFormula.value) : "";
			var VldMessage  = elemVldMessage ? TrimSpaces(elemVldMessage.value) : "";
			var ReadOnly    = frm.ReadOnly   ? "TRUE" : "";
			if (Type == "Calculated")
			{
				Decimals = TrimSpaces( GetSelectedValue(frm.Decimals) );
			}
			if (Type=="Number" || Type=="Currency")
			{
				if (Max != "" && Min != "" && (Max - 0) < (Min - 0))
				{
				AlertAndSetFocus(L_alert6_Text, frm[FrmLocalFieldName("Min")] );
				return false;
				}
				else if (Min != "" && Default != "" && (Default - 0) < (Min - 0))
				{
					AlertAndSetFocus(L_alert8_Text, frm[FrmLocalFieldName("DefaultText")]);
					return false;
				}
				if (Max != "" && Default != "" && (Default - 0) > (Max - 0))
				{
					AlertAndSetFocus(L_alert9_Text, frm[FrmLocalFieldName("DefaultText")]);
					return false;
				}
				<%if(! bPercentage){%>
				if (Type=="Number" && Percentage == "TRUE")
				{
					if (Min != "") Min = StDivideByOneHundred(Min);
					if (Max != "") Max = StDivideByOneHundred(Max);
					if (Default != "") Default = StDivideByOneHundred(Default);
				}
				<%}else{%>
				if (Type=="Number" && Percentage != "TRUE")
				{
					if (Min != "") Min = StMultiplyByOneHundred(Min);
					if (Max != "") Max = StMultiplyByOneHundred(Max);
					if (Default != "") Default = StMultiplyByOneHundred(Default);
				}
				<%}%>
			}
			else if (Type=="Text" && Default)
			{
				if (MaxLength != "" && Default.length > (MaxLength - 0))
				{
					AlertAndSetFocus(L_alert11_Text, frm.DefaultText);
					return false;
				}
			}
			<% if (spList != null && !bListHasVersioning){%>
			if (Type == "Note" && AppendOnly == "TRUE")
			{
				AlertAndSetFocus(L_alert25_Text, frm.AppendOnly[1]);
				frm.AppendOnly[1].checked=1;
				return false;
			}
			<%}%>
			if (Type == "Choice" && Format == "Checkboxes")
			{
				Type = "MultiChoice";
				Format = "";
			}
			if (Type == "GridChoice")
			{
				if (GridTxtRng1.length > 150)
				{
					alert(L_alert22_Text);
					frm.GridTxtRng1.focus();
					return false;
				}
				if (GridTxtRng2.length > 150)
				{
					alert(L_alert22_Text);
					frm.GridTxtRng2.focus();
					return false;
				}
				if (GridTxtRng3.length > 150)
				{
					alert(L_alert22_Text);
					frm.GridTxtRng3.focus();
					return false;
				}
				  if (frm.GridShowNA.checked)
				  {
					if (GridNATxt.length > 150)
					{
						alert(L_alert23_Text);
						frm.GridNATxt.focus();
						return false;
					}
				}
				else
				{
					GridNATxt="";
				}
				if (GridStartNum != 1 || GridEndNum < 3 || GridEndNum > 20)
				{
					alert(L_alert20_Text);
					frm.GridNumRange.focus();
					return false;
				}
				var GridWidth   = GridEndNum - GridStartNum;
				if (GridWidth < 2)
				{
					alert(L_alert20_Text);
					frm.GridNumRange.focus();
					return false;
				}
			}
			var Schema = ('<Field ' +
				(Name         ? 'Name="'        + SimpleHTMLEncodeMultiLine(Name)+ '" ' : '') +
				(FromBaseType ? 'FromBaseType="'+ SimpleHTMLEncode(FromBaseType) + '" ' : '') +
				(DisplaySize  ? 'DisplaySize="' + DisplaySize                    + '" ' : '') +
				(Type         ? 'Type="'        + SimpleHTMLEncode(Type)         + '" ' : '') +
				(LookupList   ? 'List="'        + SimpleHTMLEncode(LookupList)   + '" ' : '') +
				(LookupField  ? 'ShowField="'   + SimpleHTMLEncode(LookupField)  + '" ' : '') +
				(DisplayName  ? 'DisplayName="' + SimpleHTMLEncodeMultiLine(DisplayName)+ '" ' : '') +
				(Description  ? 'Description="' + SimpleHTMLEncode(Description)  + '" ' : '') +
				(Required.length > 0 ? 'Required="'    + SimpleHTMLEncode(Required)     + '" ' : '') +
				(EnforceUniqueValues.length > 0 ? 'EnforceUniqueValues="' + SimpleHTMLEncode(EnforceUniqueValues) + '" ' : '') +
				(Indexed.length > 0 ? 'Indexed="'    + SimpleHTMLEncode(Indexed)     + '" ' : '') +
				(UnlimitedLengthInDocumentLibrary ? 'UnlimitedLengthInDocumentLibrary="'    + SimpleHTMLEncode(UnlimitedLengthInDocumentLibrary)     + '" ' : '') +
				(NumLines     ? 'NumLines="'    + SimpleHTMLEncode(NumLines)     + '" ' : '') +
				(Format       ? 'Format="'      + SimpleHTMLEncode(Format)       + '" ' : '') +
				(MaxLength    ? 'MaxLength="'   + MaxLength                      + '" ' : '') +
				(Min          ? 'Min="'         + Min                            + '" ' : '') +
				(Max          ? 'Max="'         + Max                            + '" ' : '') +
				(Percentage   ? 'Percentage="'  + Percentage                     + '" ' : '') +
				(RichText     ? 'RichText="'    + RichText                       + '" ' : '') +
				(RichTextMode ? 'RichTextMode="' + RichTextMode                  + '" ' : '') +
				(RichTextMode == 'FullHtml' ? 'IsolateStyles="TRUE" ' : '') +
				(AllowHyperlink ? 'AllowHyperlink="' + AllowHyperlink            + '" ' : '') +
				(AppendOnly   ? 'AppendOnly="'  + AppendOnly                     + '" ' : '') +
				(Decimals     ? 'Decimals="'    + Decimals                       + '" ' : '') +
				(LCID         ? 'LCID="'        + LCID                           + '" ' : '') +
				(CalType      ? 'CalType="'     + CalType                        + '" ' : '') +
				(Direction    ? 'Direction="'   + Direction                      + '" ' : '') +
				(FillInChoice ? 'FillInChoice="'+ FillInChoice                   + '" ' : '') +
				(ResultType   ? 'ResultType="'  + SimpleHTMLEncode(ResultType)   + '" ' : '') +
				(Type=="Note" ? 'Sortable="FALSE" '                                     : '') +
				(DefaultURLDesc ? 'DefaultURLDesc="' + SimpleHTMLEncode(DefaultURLDesc) + '" ' : '') +
				(ReadOnly     ? 'ReadOnly="'    + ReadOnly                       + '" ' : '') +
				(ShowPresence ? 'Presence="'    + ShowPresence                   + '" ' : '') +
				(GroupName    ? 'Group="'       + SimpleHTMLEncode(GroupName)    + '" ' : '') +
				(FriendlyFormat    ? 'FriendlyDisplayFormat="'       + SimpleHTMLEncode(FriendlyFormat)    + '" ' : '') +
				(GridStartNum ? 'GridStartNum="'+ GridStartNum                   + '" ' : '') +
				(GridEndNum   ? 'GridEndNum="'  + GridEndNum                     + '" ' : '') +
				(GridTxtRng1  ? 'GridTxtRng1="' + SimpleHTMLEncode(GridTxtRng1)  + '" ' : '') +
				(GridTxtRng2  ? 'GridTxtRng2="' + SimpleHTMLEncode(GridTxtRng2)  + '" ' : '') +
				(GridTxtRng3  ? 'GridTxtRng3="' + SimpleHTMLEncode(GridTxtRng3)  + '" ' : '') +
				(GridNATxt    ? 'GridNATxt="'   + SimpleHTMLEncode(GridNATxt)    + '" ' : '') +
<% if (bShowIME)
   {
%>
				(IMEMode      ? 'IMEMode="'     + IMEMode                        + '" ' : '') +
<% } %>
				'>'
			);
			if(DefaultFormula) {
				if (DefaultFormula.charAt(0) != '=')
				{
					DefaultFormula = "="+DefaultFormula;
				}
				Schema += '<DefaultFormula>' + SimpleHTMLEncode(DefaultFormula) + '</DefaultFormula>';
			}else if(Default)
			{
				Schema += '<Default>' + SimpleHTMLEncode(Default) + '</Default>';
			}
			if (Type == "Calculated")
			{
				if (!CheckForIllegals(Formula, false))
					return false;
				if (Formula.charAt(0) != '=')
				{
					Formula = "="+Formula;
				}
				Schema += '<Formula>' + SimpleHTMLEncode(Formula) +'</Formula>';
			}
			if (Type != "MultiChoice")
			{
				if (VldFormula)
				{
					if (!CheckForIllegals(VldFormula, true))
						return false;
					if (VldFormula.charAt(0) != '=')
						VldFormula = "="+VldFormula
					if (VldFormula.length > 1024)
					{
						alert(String.format(L_alert26_Text, 1024));
						elemVldFormula.focus();
						return false;
					}
					bHaveValidation = true;
				}
				if (VldFormula || VldMessage)
				{
					Schema += '<Validation';
					if (VldMessage)
						Schema += ' Message="' + SimpleHTMLEncode(VldMessage) + '"';
					Schema += '>' + SimpleHTMLEncode(VldFormula) + '</Validation>';
				}
			}
			if(Type == "Choice" || Type == "MultiChoice" || Type == "OutcomeChoice")
			{
				re = /\\r\\n+/g;
				Choices = Choices.replace(re, "\\r\\n");
				if (TrimWhiteSpaces(Choices) == "")
				{
					alert(L_alert13_Text);
					frm.Choices.focus();
					return false;
				}
				if (-1 != Choices.indexOf(";#"))
				{
					alert(L_alert19_Text);
					frm.Choices.focus();
					return false;
				}
				var ChoicesArr = Choices.split( /[\r\n]+/ig );
				var bFoundMatchWithDefault = false;
				Schema += '<CHOICES>';
				for( i = 0; i < ChoicesArr.length; i ++ )
				{
					var Choice = TrimWhiteSpaces( ChoicesArr[i] );
					if(Choice) {
						if(Choice.length > 255)
						{
							alert(L_alert14_Text);
							frm.Choices.focus();
							return false;
						}
						if (Default == Choice)
							bFoundMatchWithDefault = true;
						Schema += '<CHOICE>' + SimpleHTMLEncode(Choice) + '</CHOICE>';
					}
				}
				Schema += '</CHOICES>';
				if (Default && !bFoundMatchWithDefault)
				{
					alert(L_alert15_Text);
					frm.DefaultText.focus();
					return false;
				}
			}
			if(Type == "GridChoice")
			{
				if (TrimSpaces(GridChoices) == "")
				{
					alert(L_alert13_Text);
					frm.GridChoices.focus();
					return false;
				}
				if (-1 != GridChoices.indexOf(";#"))
				{
					alert(L_alert19_Text);
					frm.GridChoices.focus();
					return false;
				}
				var GridChoicesArr = GridChoices.split( /[\r\n]+/ig );
				if (GridChoicesArr.length > 50)
				{
					alert(L_alert19A_Text);
					frm.GridChoices.focus();
					return false;
				}
				Schema += '<CHOICES>';
				for( i = 0; i < GridChoicesArr.length; i ++ )
				{
					var Choice = TrimSpaces( GridChoicesArr[i] );
					if(Choice)
					{
						if(Choice.length > 255)
						{
							alert(L_alert14_Text);
							frm.GridChoices.focus();
							return false;
						}
						Schema += '<CHOICE>' + SimpleHTMLEncode(Choice) + '</CHOICE>';
					}
				}
				Schema += '</CHOICES>';
			}
			Schema += '<%SPHttpUtility.WriteEcmaScriptStringLiteralEncode(strHiddenSchema, this);%></Field>';
<%
}
else
{
%>
			var Description = frm.Description ? TrimSpaces( frm.Description.value ): "";
			var Direction   = frm.Direction  ? GetSelectedValue(frm.Direction) : "";
			var radioPushdown = document.getElementById("RadPushDownYes");
			var PushDown = (radioPushdown != null && radioPushdown.checked) ? "1" : "";
			var Schema = ('<Field Type="' + Type + '" ' +
				(Name         ? 'Name="'        + SimpleHTMLEncode(Name)         + '" ' : '') +
				(DisplayName  ? 'DisplayName="' + SimpleHTMLEncode(DisplayName)  + '" ' : '') +
				(Description  ? 'Description="' + SimpleHTMLEncode(Description)  + '" ' : '') +
				(Direction    ? 'Direction="'   + SimpleHTMLEncode(Direction)    + '" ' : '') +
				(GroupName    ? 'Group="'       + SimpleHTMLEncode(GroupName)    + '" ' : '') +
				'>'
			);
			Schema += '</Field>';
<%
}
%>
			document.frmSubmit.FieldName.value        = DisplayName;
			document.frmSubmit.FieldXML.value         = Schema;
		}
		document.frmSubmit.AddToDefaultView.value = AddToDefVw;
		document.frmSubmit.AddToAllContentTypes.value = AddToAllContentTypes;
		document.frmSubmit.PushDown.value = PushDown;
		SubmitButtonOnClick(btn);
		document.frmSubmit.submit();
		return true;
	}
	var g_FieldName = new Array;
<%
	SPFieldCollection availableFields;
	if (spList != null)
		availableFields = spList.Fields;
	else
		availableFields = Web.AvailableFields;
	for (int i =0; i < availableFields.Count; i++)
	{
		SPField spFieldTmp;
		try
		{
			spFieldTmp = availableFields[i];
			if (spFieldTmp.Hidden || spFieldTmp.Group == "_Hidden")
				continue;
			if (spFieldTmp.InternalName == "LinkTitle" || spFieldTmp.InternalName == "LinkTitleNoMenu")
				continue;
	%>
	g_FieldName[<%SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(spFieldTmp.TitleResource.GetValueForUICulture(Web.UICulture)),this.Page);%>.toLowerCase()] = 1;
	<%
		}
		catch
		{}
	}
%>
</SharePoint:ScriptBlock>
	 <div style="width: 680px; height: 1px;"></div>
	 <table  border="0" cellpadding="0" cellspacing="0" width="100%" id="AutoNumber1">
<!--New form UI-->
<tr>
 <td>
<SharePoint:ScriptBlock runat="server" WriteEnabled="true">
	function doesFieldNameConflict( strName )
	{
		if (g_FieldName[strName.toLowerCase()])
			return true;
		else
			return false;
	}
	function clearOutDefaultWithCheck(){
		if(!document.getElementById('onetidDefaultChoiceValue2').checked)
			clearOutDefault();
	}
	function clearOutDefault()
	{
		var frm = document.forms[MSOWebPartPageFormName];
		var Choices = frm.Choices ? frm.Choices.value : "";
		var ChoicesArr  = Choices.split( /[\r\n]+/ig );
		var Default     = frm.DefaultText ? TrimSpaces(frm.DefaultText.value): "";
		for (i = 0; i < ChoicesArr.length; i++)
		{
			if (ChoicesArr[i] == Default)
				return;
		}
		if (Default != "")
		{
			if (ChoicesArr.length > 0)
				frm.DefaultText.value = ChoicesArr[0];
			else
				frm.DefaultText.value = "";
		}
	}
</SharePoint:ScriptBlock>
<table  border="0" width="100%" cellspacing="0" cellpadding="0" class="ms-v4propertysheetspacing">
<input type="hidden" value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(strName),this.Page);%> name="Name" />
<!-- Name and Type-->
		<tr><td class="ms-sectionline" height="1" colspan="4"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
		<tr>
			<td nowrap="nowrap" rowspan="4"></td>
			<td class="ms-descriptiontext ms-formdescriptioncolumn-wide" rowspan="4" valign="top" id="align02">
				<table border="0" cellpadding="1" cellspacing="0">
<%
		if (!bSealed)
		{
%>
					<tr><td height="28" valign="top" class="ms-sectionheader" id="onetidFldEditGuts1"><h3 class="ms-standardheader"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_questionandtype%>" EncodeMethod='HtmlEncode'/></h3></td></tr>
					<tr><td id="onetidNewColumnDescription" class="ms-descriptiontext"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_typeyouranswer%>" EncodeMethod='HtmlEncode'/></td></tr>
<%
		}
		else
		{
%>
					<tr><td height="28" valign="top" class="ms-sectionheader" id="onetidFldEditGuts1"><h3 class="ms-standardheader"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_question%>" EncodeMethod='HtmlEncode'/></h3></td></tr>
					<tr><td id="onetidNewColumnDescription" class="ms-descriptiontext"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_typeyourquestion2%>" EncodeMethod='HtmlEncode'/></td></tr>
<%
		}
%>
					<tr><td><img src="/_layouts/15/images/blank.gif?rev=40" width='100' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
				</table>
			</td>
		</tr>
		<tr>
			<td class="ms-authoringcontrols" width="10">&#160;</td>
			<td class="ms-authoringcontrols" id="onetidFldEditGuts2">
				<table border="0">
					<tr>
						<td>
							<label for="idColName"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_question%>" EncodeMethod='HtmlEncode'/>&nbsp;(SI):</label><font size="3">&#160;</font><br />
							<table border="0" cellspacing="1">
								<tr>
									<td colspan="2">
											<textarea class="ms-long" cols=40 rows=5 name="DisplayName" id="idColName" size=30 style="display:none;"></textarea>
										<textarea class="ms-long" cols=40 rows=5 name="DisplayNameSI" id="idColNameSI" size=30
			<%        if (FieldTypeName == "PageSeparator")
					{
			%>
										disabled="true"
			<%
			}
			%>
										 onKeyUp="CopyQuestion();"><%SPHttpUtility.WriteHtmlEncode(strDisplayName,this.Page);%></textarea>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<label for="idColName"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_question%>" EncodeMethod='HtmlEncode'/>&nbsp;(EN):</label><font size="3">&#160;</font><br />
							<table border="0" cellspacing="1">
								<tr>
									<td colspan="2">
										<textarea class="ms-long" cols=40 rows=5 name="DisplayNameEN" id="idColNameEN" size=30
			<%        if (FieldTypeName == "PageSeparator")
					{
			%>
										disabled="true"
			<%
			}
			%>
										 onKeyUp="CopyQuestion();"><%SPHttpUtility.WriteHtmlEncode(strDisplayName,this.Page);%></textarea>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<SharePoint:ScriptBlock runat="server" WriteEnabled="true">
			(function() {
				var currDisplayName = $("#idColName").val().trim();
				if (currDisplayName.length === 0) {
					CopyQuestion();
				}
			})();

			function CopyQuestion()
			{
				$("#idColName").val("");

				var textSI = $("#idColNameSI").val().trim();
				var textEN = $("#idColNameEN").val().trim();

				if ((textSI.length > 0) && (textEN.length > 0) && (textSI != textEN)) {
					$("#idColName").val(textSI + " || " + textEN);
				} else if (textSI.length > 0) {
					$("#idColName").val(textSI);
				} else if (textEN.length > 0) {
					$("#idColName").val(textEN);
				}
			}
		</SharePoint:ScriptBlock>
		<tr><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
		<tr>
			<td class="ms-authoringcontrols" width="10">&#160;</td>
			<td class="ms-authoringcontrols" id="onetidFldEditGuts3"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_answertoquestion%>" EncodeMethod='HtmlEncode'/>
				<font size="3">&#160;</font><br />
				<table border="0" cellspacing="0">
					<tr>
						<td colspan="2">
							<table width="100%" cellpadding="0" cellspacing="1" border="0">
								<tr>
									<td align="center" nowrap="nowrap" class="ms-authoringcontrols">
									<% if ( FieldTypeName == "Choice" ) { %> <input onclick="UpdatePage('Choice')" type="radio" value="Choice" id="onetidTypeChoice" name="Type" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_TTL_TXT_TypeChoice%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input onclick="UpdatePage('Choice')" type="radio" value="Choice" id="onetidTypeChoice" name="Type" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_TTL_TXT_TypeChoice%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
									</td>
									<td  class="ms-authoringcontrols" id="L_onetidTypeChoice"><label for="onetidTypeChoice"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_TypeChoice%>" EncodeMethod='HtmlEncode'/></label></td>
								</tr>
<%
SPFieldTypeDefinitionCollection fieldTypes = Web.FieldTypeDefinitionCollection;
SPFieldTypeDefinition selctedFieldType = null;
for (Int32 i = 0; i < fieldTypes.Count; i++)
{
	if(! fieldTypes[i].UserCreatable)
		continue;
	if (Enum.IsDefined(typeof(SPFieldType), fieldTypes[i].TypeName))
		continue;
	if (spList == null)
	{
		if(! fieldTypes[i].ShowOnColumnTemplateCreate)
			continue;
	}
	else
	{
		if (spList.BaseType == SPBaseType.GenericList)
		{
			if(! fieldTypes[i].ShowOnListCreate)
				continue;
		}
		else if (spList.BaseType == SPBaseType.DocumentLibrary)
		{
			if(! fieldTypes[i].ShowOnDocumentLibraryCreate)
				continue;
		}
		else if (spList.BaseType == SPBaseType.Survey)
		{
			if(! fieldTypes[i].ShowOnSurveyCreate)
				continue;
		}
	}
}
%>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	  <tr><td colspan="2">&#160;</td><td class="ms-authoringcontrols" colspan="2" height="21">&#160;</td></tr>
<!-- Group Settings -->
	<asp:PlaceHolder ID="GroupNameSection" Runat="server">
	<tr><td class="ms-sectionline" height="1" colspan="4"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td nowrap="nowrap"></td>
		<td class="ms-descriptiontext ms-formdescriptioncolumn-wide" valign="top">
			<table border="0" cellpadding="1" cellspacing="0">
				<tr><td height="28" valign="top" class="ms-sectionheader" id="onetidNewColumnOption"><h3 class="ms-standardheader"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_group_header%>" EncodeMethod='HtmlEncode'/></h3></td></tr>
				<tr><td class="ms-propertysheet" id="onetidNewColumnOption2"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_group_description%>" EncodeMethod='HtmlEncode'/></td></tr>
			</table>
		</td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
	   <td class="ms-authoringcontrols" id="onetidFldEditGuts6">
		<table class="ms-authoringcontrols" border="0" width="100%" cellspacing="0" cellpadding="0">
		<tr><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td>
			   <td class="ms-authoringcontrols" width="10">&#160;</td></tr>
			<wssuc:InputFormControl runat="server" LabelText="<%$Resources:wss,fldedit_group_put_template%>">
			</wssuc:InputFormControl>
			<wssawc:InputFormRadioButton GroupName="GrpGroupName" id="RadExistingGroup"
				LabelText="<%$Resources:wss,fldedit_group_existing_group%>"
				onclick="javascript:HandleGroupClick(true)"
				ToolTip="<%$Resources:wss,fldedit_group_existing_group_ttl_txt%>"
				checked="true" runat="server">
				<select id="SelectExistingGroupName" runat="server" checked="true" />
			</wssawc:InputFormRadioButton>
			<wssawc:InputFormRadioButton GroupName="GrpGroupName" id="RadNewGroup"
				LabelText="<%$Resources:wss,fldedit_group_new_group%>"
				onclick="javascript:HandleGroupClick(false)"
				ToolTip="<%$Resources:wss,fldedit_group_new_group_ttl_txt%>"
				runat="server">
				<input type="text" id="TxtNewGroupName" title="<%$Resources:wss,fldedit_group_new_group_ttl_txt%>" maxlength="128" size="40" runat="server" />
				<span class="ms-formvalidation" id="NewGroupFieldMissingWarning" Visible="false" runat="server"><br /><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,ctypedit_group_empty_error%>" EncodeMethod='HtmlEncode'/></span>
			</wssawc:InputFormRadioButton>
			</table>
		</td>
	  </tr>
	  <tr><td colspan="2">&#160;</td><td class="ms-authoringcontrols" colspan="2" height="21">&#160;</td></tr>
	  </asp:PlaceHolder>
<%
if (FieldTypeName  == "PageSeparator")
	goto showSubmitButtons;
%>
<!--Optional settings -->
	<tr><td class="ms-sectionline" height="1" colspan="4"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td nowrap="nowrap"></td>
		<td class="ms-descriptiontext ms-formdescriptioncolumn-wide" valign="top" id="align03">
			<table border="0" cellpadding="1" cellspacing="0">
				<tr><td height="28" valign="top" class="ms-sectionheader" id="onetidNewColumnOption"><h3 class="ms-standardheader"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_optionalsetforquestion%>" EncodeMethod='HtmlEncode'/></h3></td></tr>
				<tr><td class="ms-descriptiontext" id="onetidNewColumnOption2"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_specifydetanswer%>" EncodeMethod='HtmlEncode'/></td></tr>
			</table>
		</td>
<%
if (!bSealed)
{
  switch ( FieldTypeName )
  {
	case "Boolean" : break;
	case "Calculated" : break;
	default :
%>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidTypeRequiredData">
<%
if (spList == null && !string.IsNullOrEmpty(ContentTypeId))
	strDisableRequired = "DISABLED";
%>
			<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_surv_requireresp%>" EncodeMethod='HtmlEncode'/><!-- -->
		<font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
				   <% if ( bRequired == true ) { %> <input type="radio" name="Required" value="TRUE" id="onetidRequiredTrue" <%=strDisableRequired%> title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_surv_requiresrespyes%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="radio" name="Required" value="TRUE" id="onetidRequiredTrue" <%=strDisableRequired%> title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_surv_requiresrespyes%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
					</td>
					<td class="ms-authoringcontrols" id="onetidYes"><label for="onetidRequiredTrue"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_yes%>" EncodeMethod='HtmlEncode'/><!-- -->&#160; &#160;</label></td>
					<td class="ms-authoringcontrols">
					<% if ( bRequired == true ) { %> <input type="radio" name="Required" value="FALSE" id="onetidRequiredFalse" <%=strDisableRequired%> title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_surv_requiresrespno%>' EncodeMethod='HtmlEncode'/>" /> <% ; } else { %> <input type="radio" name="Required" value="FALSE" id="onetidRequiredFalse" <%=strDisableRequired%> title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_surv_requiresrespno%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ;} %>
					</td>
					<td class="ms-authoringcontrols" id="onetidNo"><label for="onetidRequiredFalse"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_no%>" EncodeMethod='HtmlEncode'/></label></td>
				</tr>
			</table>
		</td>
	</tr>
<%
	break;
}
%>
<%
  if (CanSetUniquenessOnNewField(FieldTypeName)
	  && !(spList == null && !string.IsNullOrEmpty(ContentTypeId)))
  {
%>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidTypeEnforceUniqueValuesData">
		<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_enforceUniqueValues%>" EncodeMethod='HtmlEncode'/><!-- -->
		<font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
				   <% if ( bEnforceUniqueValues == true ) { %> <input type="radio" name="EnforceUniqueValues" value="TRUE" id="onetidEnforceUniqueValuesTrue" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_enforceUniqueValuesYes%>' EncodeMethod='HtmlEncode'/>" onclick="javascript:showEnforceUniqueValuesValidationRow();" checked="checked" /> <% ; } else { %> <input type="radio" name="EnforceUniqueValues" value="TRUE" id="onetidEnforceUniqueValuesTrue" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_enforceUniqueValuesYes%>' EncodeMethod='HtmlEncode'/>" onclick="javascript:showEnforceUniqueValuesValidationRow();" /> <% ; } %>
					</td>
					<td class="ms-authoringcontrols" id="onetidYes"><label for="onetidEnforceUniqueValuesTrue"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_yes%>" EncodeMethod='HtmlEncode'/><!-- -->&#160; &#160;</label></td>
					<td class="ms-authoringcontrols">
					<% if ( bEnforceUniqueValues == true ) { %> <input type="radio" name="EnforceUniqueValues" value="FALSE" id="onetidEnforceUniqueValuesFalse" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_enforceUniqueValuesNo%>' EncodeMethod='HtmlEncode'/>" /> <% ; } else { %> <input type="radio" name="EnforceUniqueValues" value="FALSE" id="onetidEnforceUniqueValuesFalse" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_enforceUniqueValuesNo%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ;} %>
					</td>
					<td class="ms-authoringcontrols" id="onetidNo"><label for="onetidEnforceUniqueValuesFalse"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_no%>" EncodeMethod='HtmlEncode'/></label></td>
				</tr>
			</table>
		<div id="enforceUniqueValuesValidationText" class="ms-error" style="display:none;width:250px"></div>
		</td>
	</tr>
<%
	}
%>
<%
switch ( FieldTypeName )
{
	case "Note" :
		if (SPBaseType.DocumentLibrary == iBaseType ||
			SPBaseType.UnspecifiedBaseType == iBaseType)
		{
		string strYes = (string)(this.GetGlobalResourceObject("wss", "fldedit_UnlimitedLengthInDocumentLibraryYes"));
		string strNo = (string)(this.GetGlobalResourceObject("wss", "fldedit_UnlimitedLengthInDocumentLibraryNo"));
%>
		<tr><td colspan="2"></td><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
		<tr>
			<td colspan="2"></td>
			<td class="ms-authoringcontrols" width="10">&#160;</td>
			<td class="ms-authoringcontrols" id="onetidUnlimitedLengthInDocumentLibraryData">
				<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_UnlimitedLengthInDocumentLibrary%>" EncodeMethod='HtmlEncode'/>
			<font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
					<input type="radio" name="UnlimitedLengthInDocumentLibrary"
						   id="onetidUnlimitedLengthInDocumentLibraryTrue"
						   OnClick="ConfirmSelectingUnlimitedLengthInDocumentLibrary()"
						   title="<%=strYes%>"
						   <%if (bUnlimitedLengthInDocumentLibrary){%>checked="checked"<%}%>
						   value="TRUE" />
					</td>
					<td class="ms-authoringcontrols" id="onetidYes"><label for="onetidUnlimitedLengthInDocumentLibraryTrue"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_yes%>" EncodeMethod='HtmlEncode'/><!-- -->&#160; &#160;</label></td>
					<td class="ms-authoringcontrols">
					<input type="radio" name="UnlimitedLengthInDocumentLibrary"
						   id="onetidUnlimitedLengthInDocumentLibraryFalse"
						   title="<%=strNo%>"
						   <%if (!bUnlimitedLengthInDocumentLibrary){%>checked="checked"<%}%>
						   value="TRUE" />
					</td>
					<td class="ms-authoringcontrols" id="onetidNo"><label for="onetidUnlimitedLengthInDocumentLibraryFalse"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_no%>" EncodeMethod='HtmlEncode'/></label></td>
				</tr>
			</table>
			</td>
		</tr>
<%
		}
%>
		<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidMaxLines"><label for="idNumLines"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidMaxLines%>" EncodeMethod='HtmlEncode'/> </label><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td colspan="2"><SharePoint:ScriptBlock runat="server" WriteEnabled="true">g_fld = new NumberField(helperFrm,"NumLines",L_alert12_Text,"<% if (iNumLines != int.MaxValue) SPHttpUtility.WriteNoEncode(iNumLines, this);%>");g_fld.wMin = "1";g_fld.wMax = "1000";g_fld.fInteger = true;g_fld.BuildUI();</SharePoint:ScriptBlock></td>
				</tr>
			</table>
		</td>
	</tr>
<%
if ((SPBaseType.DocumentLibrary != iBaseType)
)
{
%>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidTypeRichText"><label for="onetidRichText"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_RichTextID%>" EncodeMethod='HtmlEncode'/></label><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
				   <% if ( bRichText == true ) { %> <input type="radio" name="RichText" value="PLAIN" id="onetidRichTextPlain" <% if (bDisableRichTextModeControl) { %>disabled="true"<% } %>title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_richtext_plain%>' EncodeMethod='HtmlEncode'/>" /> <% ; } else { %> <input type="radio" name="RichText" value="PLAIN" id="onetidRichTextPlain" <% if (bDisableRichTextModeControl) { %>disabled="true"<% } %>title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_richtext_plain%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ;} %>
					</td>
					<td class="ms-authoringcontrols" id="onetidRichTextPlainLabel"><label for="onetidRichTextPlain"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_richtext_plain%>" EncodeMethod='HtmlEncode'/><!-- -->&#160; &#160;</label></td>
				</tr>
				<tr>
					<td class="ms-authoringcontrols">
					<% if ( (bRichText && RichTextMode == SPRichTextMode.FullHtml) == true ) { %> <input type="radio" name="RichText" value="FullHtml" id="onetidRichTextFullHtml" <% if (bDisableRichTextModeControl) { %>disabled="true"<% } %>title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_richtext_fullhtml%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="radio" name="RichText" value="FullHtml" id="onetidRichTextFullHtml" <% if (bDisableRichTextModeControl) { %>disabled="true"<% } %>title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_richtext_fullhtml%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
					</td>
					<td class="ms-authoringcontrols" id="onetidNo"><label for="onetidRichTextFullHtml"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_richtext_fullhtml%>" EncodeMethod='HtmlEncode'/></label></td>
					<%
						if (bAllowHyperlink) {%>
							<input type="hidden" name="AllowHyperlink" value="TRUE" />
					<%}%>
				</tr>
			</table>
		</td>
	</tr>
<%
}
	if (bShowBidiDirection) {%>
	<tr> <td colspan="2"></td> <td class="ms-authoringcontrols" height="35" width="10">&#160;</td> <td class="ms-authoringcontrols" id="onetidDirection"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_idDirection%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br /> <table border="0" cellspacing="1"> <tr> <td colspan="2" class="ms-authoringcontrols"> <select name="Direction" id="FieldDirection"> <% if ( strDirection == "None" ) { %> <option value="None" id="onetidDirNone" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="None" id="onetidDirNone"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "ltr" ) { %> <option value="ltr" id="onetidDirLTR" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="ltr" id="onetidDirLTR"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "rtl" ) { %> <option value="rtl" id="onetidDirRTL" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="rtl" id="onetidDirRTL"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> </select> </td> </tr> </table> </td> </tr>
	<%}%>
<%
break;
case "Boolean":
%>
	<!-- Boolean -->
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidTypeDefaultBooleanValue"><label for="idDefault"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidTypeDefaultBooleanValue%>" EncodeMethod='HtmlEncode'/>:</label><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
						<select name="Default" id="idDefault">
						<% if ( strDefault == "1" ) { %> <option value="1" id="onetidTrue" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_yes%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="1" id="onetidTrue"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_yes%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDefault == "0" ) { %> <option value="0" id="onetidFalse" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_no%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="0" id="onetidFalse"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_no%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
<%
break;
case "URL":
%>
	<!-- URL -->
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidFormatUrl"><label for="idFormat"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidFormatUrl%>" EncodeMethod='HtmlEncode'/></label><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
						<select name="Format" id="idFormat">
						<% if ( strFormat == "Hyperlink" ) { %> <option value="Hyperlink" id="onetidHyperlink" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_hyperlink%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="Hyperlink" id="onetidHyperlink"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_hyperlink%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strFormat == "Image" ) { %> <option value="Image" id="onetidImage" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_picture%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="Image" id="onetidImage"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_picture%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<%if (bShowBidiDirection) {%>
	<tr> <td colspan="2"></td> <td class="ms-authoringcontrols" height="35" width="10">&#160;</td> <td class="ms-authoringcontrols" id="onetidDirection"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_idDirection%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br /> <table border="0" cellspacing="1"> <tr> <td colspan="2" class="ms-authoringcontrols"> <select name="Direction" id="FieldDirection"> <% if ( strDirection == "None" ) { %> <option value="None" id="onetidDirNone" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="None" id="onetidDirNone"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "ltr" ) { %> <option value="ltr" id="onetidDirLTR" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="ltr" id="onetidDirLTR"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "rtl" ) { %> <option value="rtl" id="onetidDirRTL" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="rtl" id="onetidDirRTL"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> </select> </td> </tr> </table> </td> </tr>
	<%}%>
<%
break;
case "Calculated" :
%>
	<!-- Calculated -->
		<td class="ms-authoringcontrols" height="35" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidDefaultTextValue1">
			<table border="0" cellspacing="1">
				<tr nowrap="nowrap">
					<td class="ms-propertysheet" id="onetidIODefText0"  > <label for="onetidIODefTextValue1"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_formula%>" EncodeMethod='HtmlEncode'/></label><!-- --> </td>  <td class="ms-propertysheet" id="onetidIODefText1" > <label for="onetidIOCalcFields1"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_insertcolumn%>" EncodeMethod='HtmlEncode'/></label><!-- --> </td>
				</tr>
				<tr nowrap="nowrap">
					<td class="ms-propertysheet" nowrap="nowrap">
					<textarea  class="ms-formula" name="Formula"  rows="8" cols="24" id="onetidIODefTextValue1" dir="ltr"><%SPHttpUtility.WriteHtmlEncode(strFormula,this.Page);%></textarea>
					</td>
					<td>
						<select name="FrmFields" size="10" id="onetidIOCalcFields1" ondblclick="javascript:AddColumnToFormula()" >
						 <%
							SPFieldCollection spFlds = spFields;
							if (spList == null)
								spFlds = Web.AvailableFields;
							WriteFieldNamesForFormulaColumnPicker(Response.Output, spFlds, strDisplayName);
						 %>
						</select>
						</td>
				 </tr><tr nowrap="nowrap">
							<td>&#160;</td>
							<td class="ms-propertysheet" nowrap="nowrap" align="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,multipages_direction_right_align_value%>' EncodeMethod='HtmlEncode'/>" id="onetDIRAlign1" >
								<a href="javascript:AddColumnToFormula()" id="onetidAddCalcText1"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidAddCalcText1%>" EncodeMethod='HtmlEncode'/></a>
								<SharePoint:ScriptBlock runat="server" WriteEnabled="true">
								function AddColumnToFormula()
								{
									var fldselected = TrimSpaces( GetSelectedValue(document.forms[MSOWebPartPageFormName].FrmFields));
									document.forms[MSOWebPartPageFormName].Formula.value = document.forms[MSOWebPartPageFormName].Formula.value+fldselected;
								}
								</SharePoint:ScriptBlock>
							 </td>
					<input type="hidden" name="ReadOnly" value="TRUE" />
				</tr>
			</table>
		 <td>
	</tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" height="35" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidDefaultTextValue1"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidDefaultTextValue1%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td align="center" nowrap="nowrap" class="ms-authoringcontrols">
					  <% if ( strResultType == "Text" ) { %> <input type="radio" name="ResultType" onclick="ShowColumnFormat('Text');" value="Text" id="onetidResultType1" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dtreturedtext%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="radio" name="ResultType" onclick="ShowColumnFormat('Text');" value="Text" id="onetidResultType1" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dtreturedtext%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
					 </td>
					 <td  class="ms-authoringcontrols" id="L_onetidResultType1"><label for="onetidResultType1"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_TypeSingleLine%>" EncodeMethod='HtmlEncode'/></label></td>
				</tr>
				<tr>
					<td align="center" nowrap="nowrap" class="ms-authoringcontrols">
					<% if ( strResultType == "Number" ) { %> <input type="radio" onclick="ShowColumnFormat('Number');" value="Number" id="onetidTypeNumber1" name="ResultType" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dtreturnednumber%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="radio" onclick="ShowColumnFormat('Number');" value="Number" id="onetidTypeNumber1" name="ResultType" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dtreturnednumber%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
					</td>
					<td  class="ms-authoringcontrols" id="L_onetidTypeNumber1"><label for="onetidTypeNumber1"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_TypeNumber%>" EncodeMethod='HtmlEncode'/></label></td>
				</tr>
				<tr>
					<td align="center" nowrap="nowrap" class="ms-authoringcontrols">
					<% if ( strResultType == "Currency" ) { %> <input type="radio" onclick="ShowColumnFormat('Currency');" value="Currency" id="onetidTypeCurrency1" name="ResultType" title="<asp:literal runat='server' text='<%$Resources:wss,fldedit_dtreturnedcurrency%>' />" checked="checked" /> <% ; } else { %> <input type="radio" onclick="ShowColumnFormat('Currency');" value="Currency" id="onetidTypeCurrency1" name="ResultType" title="<asp:literal runat='server' text='<%$Resources:wss,fldedit_dtreturnedcurrency%>' />" /> <% ; } %>
					</td>
					<td  class="ms-authoringcontrols" id="L_onetidTypeCurrency1"><label for="onetidTypeCurrency1"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_TypeCurrency%>" EncodeMethod='HtmlEncode'/></label></td>
				</tr>
				<tr>
					<td align="center" nowrap="nowrap" class="ms-authoringcontrols">
					<% if ( strResultType == "DateTime" ) { %> <input type="radio" onclick="ShowColumnFormat('DateTime');" value="DateTime" id="onetidTypeDateTime1" name="ResultType" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dtreturneddate%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="radio" onclick="ShowColumnFormat('DateTime');" value="DateTime" id="onetidTypeDateTime1" name="ResultType" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dtreturneddate%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
					</td>
					<td  class="ms-authoringcontrols" id="L_onetidTypeDateTime1"><label for="onetidTypeDateTime1"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_TypeDateTime%>" EncodeMethod='HtmlEncode'/></label></td>
				</tr>
				<tr>
					<td align="center" nowrap="nowrap" class="ms-authoringcontrols">
					<% if ( strResultType == "Boolean" ) { %> <input type="radio" onclick="ShowColumnFormat('Boolean');" value="Boolean" id="onetidTypeBoolean1" name="ResultType" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dtreturnedbool%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="radio" onclick="ShowColumnFormat('Boolean');" value="Boolean" id="onetidTypeBoolean1" name="ResultType" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dtreturnedbool%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
					</td>
					<td  class="ms-authoringcontrols" id="L_onetidTypeTrueFalse1"><label for="onetidTypeBoolean1"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_TypeBoolShort%>" EncodeMethod='HtmlEncode'/></label></td>
				</tr>
			</table>
		</td>
	</tr>
	<tbody id="divDecimalID" >
	<tr>
		<td colspan="2" ></td>
		<td class="ms-authoringcontrols">&#160;</td>
		<td class="ms-authoringcontrols" id="divDecimalID1"><label for="idDecimals1"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_numberofdecimal%>" EncodeMethod='HtmlEncode'/>:</label><!-- --> <font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				 <tr>
					<td nowrap="nowrap" class="ms-authoringcontrols">
					<select name="Decimals" id="idDecimals1">
						<% if ( strDecimals == "-1" ) { %> <option value="" id="onetidAutomatic0" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_automatic%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="" id="onetidAutomatic0"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_automatic%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "0" ) { %> <option value="0" id="onetid00" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_0%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="0" id="onetid00"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_0%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "1" ) { %> <option value="1" id="onetid10" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_1%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="1" id="onetid10"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_1%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "2" ) { %> <option value="2" id="onetid20" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_2%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="2" id="onetid20"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_2%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "3" ) { %> <option value="3" id="onetid30" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_3%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="3" id="onetid30"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_3%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "4" ) { %> <option value="4" id="onetid40" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_4%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="4" id="onetid40"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_4%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "5" ) { %> <option value="5" id="onetid50" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_5%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="5" id="onetid50"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_5%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
					 </select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	</tbody>
	<tbody id="divPercentageID" >
	<tr>
		<td colspan="2" ></td>
		<td class="ms-authoringcontrols">&#160;</td>
		<td class="ms-authoringcontrols" >
			<table border="0" cellspacing="0" cellpadding="0">
			 <tr>
			   <td class="ms-authoringcontrols" id="onetidShowPercentage1" colspan="2"><label for="onetidPercentage1"><% if ( bPercentage == true ) { %> <input type="checkbox" name="Percentage" id="onetidPercentage1" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_showasper%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="checkbox" name="Percentage" id="onetidPercentage1" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_showasper%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_showasper%>" EncodeMethod='HtmlEncode'/></label></td>
			 </tr>
			</table>
		</td>
	</tr>
	</tbody>
	<tbody id="divCurrencylID" >
	<tr>
		<td colspan="2" ></td>
		<td class="ms-authoringcontrols">&#160;</td>
		<td class="ms-authoringcontrols" id="divCurrencylID1"><label for="idLCID1"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_divCurrencylID1%>" EncodeMethod='HtmlEncode'/></label><font size="3">&#160;</font><br />
		 <table border="0" cellspacing="1">
				<tr>
					<td nowrap="nowrap" class="ms-authoringcontrols">
					<asp:DropDownList id="idLCID1" runat="server" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	</tbody>
	<tbody id="divDateTimelID" >
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols">&#160;</td>
		<td class="ms-authoringcontrols" id="divDateTimelID1"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_dateformat%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
					<% if ( strFormat == "DateOnly" ) { %> <input type="radio" name="Format" value="DateOnly" id="onetidDateOnly" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dateformatdateonly%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="radio" name="Format" value="DateOnly" id="onetidDateOnly" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dateformatdateonly%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
					</td>
					<td class="ms-authoringcontrols" id="onetidYes"><label for="onetidDateOnly"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_dateonly%>" EncodeMethod='HtmlEncode'/><!-- -->&#160; &#160;</label></td>
					<td class="ms-authoringcontrols">
					<% if ( strFormat == "DateTime" ) { %> <input type="radio" name="Format" value="DateTime" id="onetidDateTime" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dateformatdatetime%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="radio" name="Format" value="DateTime" id="onetidDateTime" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dateformatdatetime%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
					</td>
					<td class="ms-authoringcontrols" id="onetidNo"><label for="onetidDateTime"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_datetime%>" EncodeMethod='HtmlEncode'/></label></td>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	</tbody>
	<%if (bShowBidiDirection) {%>
	<tr> <td colspan="2"></td> <td class="ms-authoringcontrols" height="35" width="10">&#160;</td> <td class="ms-authoringcontrols" id="onetidDirection"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_idDirection%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br /> <table border="0" cellspacing="1"> <tr> <td colspan="2" class="ms-authoringcontrols"> <select name="Direction" id="FieldDirection"> <% if ( strDirection == "None" ) { %> <option value="None" id="onetidDirNone" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="None" id="onetidDirNone"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "ltr" ) { %> <option value="ltr" id="onetidDirLTR" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="ltr" id="onetidDirLTR"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "rtl" ) { %> <option value="rtl" id="onetidDirRTL" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="rtl" id="onetidDirRTL"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> </select> </td> </tr> </table> </td> </tr>
	<%}%>
<%
break;
case "Number" :
%>
	<!-- Number -->
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidMinMaxValue"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidMinMaxValue%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols" id="onetidMin"><label for="idMin"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidMin%>" EncodeMethod='HtmlEncode'/>:</label><!-- -->&#160;<SharePoint:ScriptBlock runat="server" WriteEnabled="true">g_fld = new NumberField(helperFrm,"Min", L_alert4_Text, "<% if (dblMin != double.MinValue) SPHttpUtility.WriteNoEncode(dblMin, this);%>");g_fld.wMin = "";g_fld.wMax = "";<%if(bPercentage){%>g_fld.fPercent = true;<%}%>g_fld.BuildUI();</SharePoint:ScriptBlock></td>
					<td class="ms-authoringcontrols" id="onetidMax">&#160; &#160; &#160;<label for="idMax"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidMax%>" EncodeMethod='HtmlEncode'/>:</label><!-- -->&#160;<SharePoint:ScriptBlock runat="server" WriteEnabled="true">g_fld = new NumberField(helperFrm,"Max",L_alert5_Text, "<% if (dblMax != double.MaxValue) SPHttpUtility.WriteNoEncode(dblMax, this);%>");g_fld.wMin = "";g_fld.wMax = "";<%if(bPercentage){%>g_fld.fPercent = true;<%}%>g_fld.BuildUI();</SharePoint:ScriptBlock></td>
			   </tr>
			</table>
		</td>
	</tr>
	<tr><td colspan="2"></td><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidDecimalPlaces"><label for="idDecimals"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_numberofdecimal%>" EncodeMethod='HtmlEncode'/>:</label><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td nowrap="nowrap" class="ms-authoringcontrols">
					<select name="Decimals" id="idDecimals">
						<% if ( strDecimals == "-1" ) { %> <option value="" id="onetidAutomatic" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_automatic%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="" id="onetidAutomatic"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_automatic%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "0" ) { %> <option value="0" id="onetid0" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_0%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="0" id="onetid0"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_0%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "1" ) { %> <option value="1" id="onetid1" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_1%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="1" id="onetid1"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_1%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "2" ) { %> <option value="2" id="onetid2" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_2%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="2" id="onetid2"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_2%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "3" ) { %> <option value="3" id="onetid3" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_3%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="3" id="onetid3"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_3%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "4" ) { %> <option value="4" id="onetid4" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_4%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="4" id="onetid4"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_4%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "5" ) { %> <option value="5" id="onetid5" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_5%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="5" id="onetid5"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_5%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
					</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td colspan="2"></td><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" height="35" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidDefaultNumberValue">
			<label for="idDefaultText"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidDefaultNumberValue%>" EncodeMethod='HtmlEncode'/></label>
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
						<input type="radio" name="Default" value="" id="onetidDefaultNumberValue0" <% if (fDefaultFormulaEmpty) SPHttpUtility.WriteNoEncode("CHECKED",this.Page);%> onclick="g_fld.fCalcCheck=false;" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvaluenumber%>' EncodeMethod='HtmlEncode'/>" />
					</td>
					<td class="ms-authoringcontrols">
						<label for="onetidDefaultNumberValue0"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_number%>" EncodeMethod='HtmlEncode'/></label>
					 </td>
					<td class="ms-authoringcontrols">
						<input type="radio" name="Default" value="" id="onetidDefaultNumberValue2" <% if (!fDefaultFormulaEmpty) SPHttpUtility.WriteNoEncode("CHECKED",this.Page);%> onclick="g_fld.fCalcCheck=true;" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvaluecal%>' EncodeMethod='HtmlEncode'/>" />
					</td>
					<td class="ms-authoringcontrols">
						<label for="onetidDefaultNumberValue2"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidCalcNumberValue2%>" EncodeMethod='HtmlEncode'/></label>
					</td>
				</tr>
			</table>
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols"><SharePoint:ScriptBlock runat="server" WriteEnabled="true">g_fld = new NumberField(helperFrm,"DefaultText", L_alert7_Text,<% if (fDefaultFormulaEmpty) SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(strDefault),this.Page); else SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(strDefaultFormula),this.Page);%>);<%if (!fDefaultFormulaEmpty) SPHttpUtility.WriteNoEncode(" g_fld.fCalcCheck=true;",this.Page); %> g_fld.wMin = "";g_fld.wMax = "";<%if(bPercentage){%>g_fld.fPercent = true;<%}%>g_fld.BuildUI();</SharePoint:ScriptBlock></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td colspan="2"></td><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols">
			<table border="0" cellspacing="0" cellpadding="0">
			 <tr>
				<td class="ms-authoringcontrols">
				<% if ( bPercentage == true ) { %> <input type="checkbox" name="Percentage" id="onetidPercentage" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_showasper%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="checkbox" name="Percentage" id="onetidPercentage" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_showasper%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
				</td>
			   <td class="ms-authoringcontrols" id="onetidShowPercentage"><label for="onetidPercentage">&#160; <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_showasper%>" EncodeMethod='HtmlEncode'/></label></td>
			 </tr>
			</table>
		</td>
	</tr>
	<%if (bShowBidiDirection) {%>
	<tr> <td colspan="2"></td> <td class="ms-authoringcontrols" height="35" width="10">&#160;</td> <td class="ms-authoringcontrols" id="onetidDirection"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_idDirection%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br /> <table border="0" cellspacing="1"> <tr> <td colspan="2" class="ms-authoringcontrols"> <select name="Direction" id="FieldDirection"> <% if ( strDirection == "None" ) { %> <option value="None" id="onetidDirNone" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="None" id="onetidDirNone"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "ltr" ) { %> <option value="ltr" id="onetidDirLTR" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="ltr" id="onetidDirLTR"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "rtl" ) { %> <option value="rtl" id="onetidDirRTL" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="rtl" id="onetidDirRTL"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> </select> </td> </tr> </table> </td> </tr>
	<%}%>
<%
	break;
   case "Currency":
%>
	<!-- Currency -->
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidMinMaxCurrency"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidMinMaxValue%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols" id="onetidMin"><label for="idMin"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidMin%>" EncodeMethod='HtmlEncode'/>:</label><!-- -->&#160;<SharePoint:ScriptBlock runat="server" WriteEnabled="true">g_fld = new NumberField(helperFrm,"Min", L_alert4_Text, "<% if (dblMin != double.MinValue) SPHttpUtility.WriteNoEncode(dblMin, this);%>");g_fld.wMin = "";g_fld.wMax = "";g_fld.BuildUI();</SharePoint:ScriptBlock></td>
					<td class="ms-authoringcontrols" id="onetidMax"><label for="idMax">&#160; &#160; &#160; <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidMax%>" EncodeMethod='HtmlEncode'/>:</label><!-- -->&#160;<SharePoint:ScriptBlock runat="server" WriteEnabled="true">g_fld = new NumberField(helperFrm,"Max",L_alert5_Text, "<% if (dblMax != double.MaxValue) SPHttpUtility.WriteNoEncode(dblMax, this);%>");g_fld.wMin = "";g_fld.wMax = "";g_fld.BuildUI();</SharePoint:ScriptBlock></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td colspan="2"></td><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidCurrencyDecimal"><label for="idDecimals3"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_numberofdecimal%>" EncodeMethod='HtmlEncode'/>:</label><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td nowrap="nowrap" class="ms-authoringcontrols">
					<select name="Decimals" id="idDecimals3">
						<% if ( strDecimals == "-1" ) { %> <option value="" id="onetidAutomatic00" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_automatic%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="" id="onetidAutomatic00"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_automatic%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "0" ) { %> <option value="0" id="onetid000" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_0%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="0" id="onetid000"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_0%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "1" ) { %> <option value="1" id="onetid100" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_1%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="1" id="onetid100"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_1%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "2" ) { %> <option value="2" id="onetid200" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_2%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="2" id="onetid200"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_2%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "3" ) { %> <option value="3" id="onetid300" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_3%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="3" id="onetid300"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_3%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "4" ) { %> <option value="4" id="onetid400" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_4%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="4" id="onetid400"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_4%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						<% if ( strDecimals == "5" ) { %> <option value="5" id="onetid500" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_5%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="5" id="onetid500"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_decimal_5%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
					</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td colspan="2"></td><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidDefaultCurrencyValue">
			<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidDefaultNumberValue%>" EncodeMethod='HtmlEncode'/>
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
						<input type="radio" name="Default" value="" id="onetidDefaultCurrencyValue0" <% if (fDefaultFormulaEmpty) SPHttpUtility.WriteNoEncode("CHECKED",this.Page);%> onclick="g_fld.fCalcCheck=false;" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvaluecurrency%>' EncodeMethod='HtmlEncode'/>" />
					</td>
					<td class="ms-authoringcontrols">
					   <label for="onetidDefaultCurrencyValue0"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_currency%>" EncodeMethod='HtmlEncode'/></label>
					</td>
					<td class="ms-authoringcontrols">
						<input type="radio" name="Default" value="" id="onetidDefaultCurrencyValue2" <% if (!fDefaultFormulaEmpty) SPHttpUtility.WriteNoEncode("CHECKED",this.Page);%> onclick="g_fld.fCalcCheck=true;" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvaluecal%>' EncodeMethod='HtmlEncode'/>" />
					</td>
					<td class="ms-authoringcontrols">
						<label for="onetidDefaultCurrencyValue2"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidCalcNumberValue2%>" EncodeMethod='HtmlEncode'/></label>
					</td>
				</tr>
			</table>
			<table border="0" cellspacing="1">
				<tr>
					<td><SharePoint:ScriptBlock runat="server" WriteEnabled="true">g_fld = new NumberField(helperFrm,"DefaultText", L_alert7_Text,<% if (fDefaultFormulaEmpty) SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(strDefault),this.Page); else SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(strDefaultFormula),this.Page);%>);<%if (!fDefaultFormulaEmpty) SPHttpUtility.WriteNoEncode(" g_fld.fCalcCheck=true;",this.Page); %> g_fld.wMin = "";g_fld.wMax = "";g_fld.BuildUI();</SharePoint:ScriptBlock></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td colspan="2"></td><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidCurrencyFormat"><label for=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.NoEncode(idLCID2.ClientID),this.Page);%>><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_divCurrencylID1%>" EncodeMethod='HtmlEncode'/></label><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td nowrap="nowrap" class="ms-authoringcontrols">
					<asp:DropDownList id="idLCID2" runat="server" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<%if (bShowBidiDirection) {%>
	<tr> <td colspan="2"></td> <td class="ms-authoringcontrols" height="35" width="10">&#160;</td> <td class="ms-authoringcontrols" id="onetidDirection"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_idDirection%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br /> <table border="0" cellspacing="1"> <tr> <td colspan="2" class="ms-authoringcontrols"> <select name="Direction" id="FieldDirection"> <% if ( strDirection == "None" ) { %> <option value="None" id="onetidDirNone" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="None" id="onetidDirNone"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "ltr" ) { %> <option value="ltr" id="onetidDirLTR" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="ltr" id="onetidDirLTR"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "rtl" ) { %> <option value="rtl" id="onetidDirRTL" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="rtl" id="onetidDirRTL"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> </select> </td> </tr> </table> </td> </tr>
	<%}%>
<%
break;
case "Lookup" :
case "User" :
%>
	<!-- Lookup -->
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidLookupList"><label for="idLookupList"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_getinfofrom%>" EncodeMethod='HtmlEncode'/></label><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
						<select name="LookupList" id="idLookupList" onchange="UpdatePage('Lookup')">
			<%
					if (strLookupList == "")
						strLookupList = "UserInfo";
					if (strLookupList == "UserInfo")
					{
						FieldTypeName = "User";
			%>
						<option value="UserInfo" name="OptionLookupList" selected="selected">
							<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_fldgutsUserInfoList%>" EncodeMethod='HtmlEncode'/><!-- -->
						</option>
			<%
					}
					else if (strLookupList != "Docs")
			%>
						<option value="UserInfo" name="OptionLookupList">
							<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_fldgutsUserInfoList%>" EncodeMethod='HtmlEncode'/><!-- -->
						</option>
			<%
					int iCount = 0;
					SPSecurity.CatchAccessDeniedException = false;
					try
					{
						iCount = spLists.Count;
					}
					catch(UnauthorizedAccessException)
					{
					}
					finally
					{
						SPSecurity.CatchAccessDeniedException = bPrevDeniedState;
					}
					for (int iIndex = 0; iIndex < iCount; iIndex ++ )
					   {
							SPList spListCur = spLists[iIndex];
							if (spListCur.Hidden)
								continue;
							if  ( strLookupList == spListCur.ID.ToString("B").ToUpper() )
							{
			%>
								<option value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(spListCur.ID.ToString("B").ToUpper()),this.Page);%> name="OptionLookupList" selected="selected"> <%SPHttpUtility.WriteHtmlEncode(spListCur.Title,this.Page);%></option>
			<%
							}
							else
							{
			%>
								<option value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(spListCur.ID.ToString("B").ToUpper()),this.Page);%> name="OptionLookupList"> <%SPHttpUtility.WriteHtmlEncode(spListCur.Title,this.Page);%></option>
			<%
							}
						}
			%>
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td colspan="2">&#160;</td>
		<td class="ms-authoringcontrols" height="35" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidLookupListField"><label for="idLookupField"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_inthiscolumn%>" EncodeMethod='HtmlEncode'/></label><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
						<select name="LookupField" id="idLookupField">
<%
		if (strLookupList == "UserInfo")
		{
		 %>
				<option value="Title" name="OptionLookupField"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_fldgutsFullName%>" EncodeMethod='HtmlEncode'/></option>
				<option value="ID"    name="OptionLookupField"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_fldgutsID%>" EncodeMethod='HtmlEncode'/></option>
				<option value="EMail" name="OptionLookupField"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_fldgutsEMail%>" EncodeMethod='HtmlEncode'/></option>
				<option value="Name" name="OptionLookupField"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_fldgutsLogin%>" EncodeMethod='HtmlEncode'/></option>
		<%
		}
		else if  (strLookupList != "Docs")
		{
				SPSecurity.CatchAccessDeniedException = false;
				spFields = null;
				try
				{
					SPList spListLookup = spLists[new Guid(strLookupList)];
					if (spListLookup != null)
						spFields = spListLookup.Fields;
				}
				catch (UnauthorizedAccessException)
				{
				}
				catch (SPException)
				{
				}
				finally
				{
					SPSecurity.CatchAccessDeniedException = bPrevDeniedState;
				}
				if (spFields != null)
				{
					SPSecurity.CatchAccessDeniedException = false;
					try
					{
						foreach (SPField spFieldTmp in spFields)
						{
							if (spFieldTmp.Hidden == true)
								continue;
							switch ( spFieldTmp.Type )
							{
								case SPFieldType.Counter :
			%>
								<option value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(spFieldTmp.InternalName),this.Page);%> name="OptionLookupField">
								<%SPHttpUtility.WriteHtmlEncode(spFieldTmp.Title,this.Page);%>
								</option>
			<%
								break;
								case SPFieldType.Text :
								if ( spFieldTmp.InternalName == strLookupField)
								{
			%>
									<option value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(spFieldTmp.InternalName),this.Page);%> selected="selected" name="OptionLookupField">
			<%
								}
								else
								{
			%>
									<option value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(spFieldTmp.InternalName),this.Page);%> name="OptionLookupField">
			<%
								}
								SPHttpUtility.WriteHtmlEncode(spFieldTmp.Title,this.Page);
			%>
								</option>
			<%
								break;
							}
						}
					}
					catch (UnauthorizedAccessException ex)
					{
						 %>
						 <SharePoint:ScriptBlock runat="server">bInaccessibleList= true;</SharePoint:ScriptBlock>
						 <%
					}
					finally
					{
						SPSecurity.CatchAccessDeniedException = bPrevDeniedState;
					}
				}
			}
		%>
		</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<%
	if (strLookupList == "UserInfo" && Web.EffectivePresenceEnabled)
	{
	%>
	<tr><td colspan="2"></td><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td colspan="2">&#160;</td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols">
			<table border="0" cellspacing="0" cellpadding="0">
			 <tr>
					<td align="center" class="ms-authoringcontrols" nowrap="nowrap">
						<% if ( strShowPresence == "FALSE" ) { %> <input type="checkbox" name="ShowPresence" id="onetidShowPresence" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_includepresence%>' EncodeMethod='HtmlEncode'/>" /> <% ; } else { %> <input type="checkbox" name="ShowPresence" id="onetidShowPresence" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_includepresence%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ;} %>
					</td>
			  <td class="ms-authoringcontrols" id="onetidShowPresenceText"><label for="onetidShowPresence"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_includepresence%>" EncodeMethod='HtmlEncode'/></label></td>
			 </tr>
			</table>
		</td>
	</tr>
	<%
	}
	%>
	<%if (bShowBidiDirection) {%>
	<tr> <td colspan="2"></td> <td class="ms-authoringcontrols" height="35" width="10">&#160;</td> <td class="ms-authoringcontrols" id="onetidDirection"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_idDirection%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br /> <table border="0" cellspacing="1"> <tr> <td colspan="2" class="ms-authoringcontrols"> <select name="Direction" id="FieldDirection"> <% if ( strDirection == "None" ) { %> <option value="None" id="onetidDirNone" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="None" id="onetidDirNone"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "ltr" ) { %> <option value="ltr" id="onetidDirLTR" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="ltr" id="onetidDirLTR"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "rtl" ) { %> <option value="rtl" id="onetidDirRTL" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="rtl" id="onetidDirRTL"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> </select> </td> </tr> </table> </td> </tr>
	<%}%>
<%
break;
case "Choice":
case "OutcomeChoice":
%>
	<!-- CHOICE -->
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidEnterChoice">
			<table>
				<tr>
					<td>
						<label for="idChoices"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_typeeachchoiceonseparate%>" EncodeMethod='HtmlEncode'/> (SI):</label><font size="3">&#160;</font><br />
						<table border="0" cellspacing="1">
							<tr>
								<td>
									<textarea class="ms-input" name="Choices" id="idChoices" rows="4" cols="40" wrap="off"  onchange="clearOutDefaultWithCheck()" style="display:none;"></textarea>
									<textarea class="ms-input" name="ChoicesSI" id="idChoicesSI" rows="4" cols="40" wrap="off"  onchange="clearOutDefaultWithCheck()" onKeyUp="CopyAnswers();"><%SPHttpUtility.WriteHtmlEncode((string)(this.GetGlobalResourceObject("wss", "fldedit_L_strDefaultChoice_Text")) + "\r\n" + (string)(this.GetGlobalResourceObject("wss", "fldedit_L_strChoice2_Text")) + "\r\n" + (string)(this.GetGlobalResourceObject("wss", "fldedit_L_strChoice3_Text")),this.Page);%></textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<label for="idChoices"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_typeeachchoiceonseparate%>" EncodeMethod='HtmlEncode'/> (EN):</label><font size="3">&#160;</font><br />
						<table border="0" cellspacing="1">
							<tr>
								<td>
									<textarea class="ms-input" name="ChoicesEN" id="idChoicesEN" rows="4" cols="40" wrap="off"  onchange="clearOutDefaultWithCheck()" onKeyUp="CopyAnswers();"><%SPHttpUtility.WriteHtmlEncode((string)(this.GetGlobalResourceObject("wss", "fldedit_L_strDefaultChoice_Text")) + "\r\n" + (string)(this.GetGlobalResourceObject("wss", "fldedit_L_strChoice2_Text")) + "\r\n" + (string)(this.GetGlobalResourceObject("wss", "fldedit_L_strChoice3_Text")),this.Page);%></textarea>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<SharePoint:ScriptBlock runat="server" WriteEnabled="true">
		(function() {
			var currChoices = $("#idChoices").val().trim();
			if (currChoices.length === 0) {
				CopyAnswers();
			}
		})();

		function CopyAnswers()
		{
			$("#idChoices").val("");

			var textSI = $("#idChoicesSI").val().trim();
			var textEN = $("#idChoicesEN").val().trim();

			if ((textSI.length > 0) || (textEN.length > 0)) {
				var textSISplit = textSI.split("\n");
				var textENSplit = textEN.split("\n");

				var returnText = [];

				var nrRows = Math.max(textSISplit.length, textENSplit.length);
				for (var i = 0; i < nrRows; i++) {
					var textSIItem = textSISplit[i];
					var textENItem = textENSplit[i];

					var returnRow = [];

					if (textSIItem && textSIItem.trim().length > 0) {
						returnRow.push(textSIItem.trim());
					}
					if (textENItem && textENItem.trim().length > 0 && (textSIItem != textENItem)) {
						returnRow.push(textENItem.trim());
					}

					if (returnRow.length > 0) {
						returnText.push(returnRow.join(" || "));
					}
				}

				if (returnText.length > 0) {
					$("#idChoices").val(returnText.join("\n"));
				}
			}
		}
	</SharePoint:ScriptBlock>

<% if (FieldTypeName != "OutcomeChoice") { %>
	<tr><td colspan="2"></td><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidDisplayChoice"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidDisplayChoice%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<%
					string strChoiceFormatOnClick = "onclick = 'disableUniquenessIfMultiChoice(); showValidationSection(); return true;'";
				%>
				<tr>
					<td class="ms-authoringcontrols">
					<% if ( strFormat == "RadioButtons" ) { %> <input type="radio" name="Format" value="RadioButtons" <% SPHttpUtility.WriteNoEncode(strChoiceFormatOnClick,this.Page);%> id="onetidChoiceRadio" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dspchoiceradio%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="radio" name="Format" value="RadioButtons" <% SPHttpUtility.WriteNoEncode(strChoiceFormatOnClick,this.Page);%> id="onetidChoiceRadio" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dspchoiceradio%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
					</td>
					<td class="ms-authoringcontrols" id="031"><label for="onetidChoiceRadio"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_radiobuttons%>" EncodeMethod='HtmlEncode'/></label>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td colspan="2"></td><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidDisplayChoice"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_allowfillin%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
					<% if ( strFillInChoice == "TRUE" ) { %> <input onclick = "showFillinSection()" type="radio" name="FillInChoice" value="TRUE" id="onetidFillInChoiceTrue" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_allowfillinyes%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input onclick = "showFillinSection()" type="radio" name="FillInChoice" value="TRUE" id="onetidFillInChoiceTrue" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_allowfillinyes%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
					</td>
					<td class="ms-authoringcontrols" id="onetidYes"><label for="onetidFillInChoiceTrue"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_yes%>" EncodeMethod='HtmlEncode'/><!-- -->&#160; &#160;</label></td>
					<td class="ms-authoringcontrols">
					<% if ( strFillInChoice == "TRUE" ) { %> <input onclick = "showFillinSection()" type="radio" name="FillInChoice" value="FALSE" id="onetidFillInChoiceFalse" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_allowfillinno%>' EncodeMethod='HtmlEncode'/>" /> <% ; } else { %> <input onclick = "showFillinSection()" type="radio" name="FillInChoice" value="FALSE" id="onetidFillInChoiceFalse" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_allowfillinno%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ;} %>
					</td>
					<td class="ms-authoringcontrols" id="onetidNo"><label for="onetidFillInChoiceFalse"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_no%>" EncodeMethod='HtmlEncode'/></label></td>
				</tr>
			</table>
		</td>
	</tr>
<% } %>
	<tr><td colspan="2"></td><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" height="35" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidDefaultChoiceValue">
			<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidDefaultNumberValue%>" EncodeMethod='HtmlEncode'/>
			<table border="0" cellspacing="1">
				<td class="ms-authoringcontrols">
					<input type="radio" name="Default" value="" <% if (fDefaultFormulaEmpty) SPHttpUtility.WriteNoEncode("CHECKED",this.Page);%> title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvaluechoice%>' EncodeMethod='HtmlEncode'/>" id="onetidDefaultChoiceValue0" />
				</td>
				<td class="ms-authoringcontrols" id="onetidDefaultChoice">
					<label for="onetidDefaultChoiceValue0"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_choice%>" EncodeMethod='HtmlEncode'/></label>&#160;</font>
				</td>
				<td class="ms-authoringcontrols">
					<input type="radio" name="Default" value="" <% if (!fDefaultFormulaEmpty) SPHttpUtility.WriteNoEncode("CHECKED",this.Page);%> title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvaluecal%>' EncodeMethod='HtmlEncode'/>" id="onetidDefaultChoiceValue2" />
				</td>
				<td class="ms-authoringcontrols" id="onetidDefaultChoice2">
					<label for="onetidDefaultChoiceValue2"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidCalcNumberValue2%>" EncodeMethod='HtmlEncode'/></label>&#160;</font><br />
				</td>
			</table>
			<table border="0" cellspacing="1">
				<tr>
					<td colspan="2"></td>
					<td>
						<input class="ms-input" type="text" name="DefaultText" value='' id="onetidIODefChoiceValue" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvalue%>' EncodeMethod='HtmlEncode'/>" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<%if (bShowBidiDirection) {%>
	<tr> <td colspan="2"></td> <td class="ms-authoringcontrols" height="35" width="10">&#160;</td> <td class="ms-authoringcontrols" id="onetidDirection"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_idDirection%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br /> <table border="0" cellspacing="1"> <tr> <td colspan="2" class="ms-authoringcontrols"> <select name="Direction" id="FieldDirection"> <% if ( strDirection == "None" ) { %> <option value="None" id="onetidDirNone" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="None" id="onetidDirNone"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "ltr" ) { %> <option value="ltr" id="onetidDirLTR" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="ltr" id="onetidDirLTR"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "rtl" ) { %> <option value="rtl" id="onetidDirRTL" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="rtl" id="onetidDirRTL"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> </select> </td> </tr> </table> </td> </tr>
	<%}%>
<%
break;
case "GridChoice":
%>
	<!-- GRDICHOICE -->
	<tr>
		<td nowrap="nowrap"></td>
		<td class="ms-descriptiontext ms-formdescriptioncolumn-wide" valign="top" id="align04">
			<table border="0" cellpadding="1" cellspacing="0">
				<tr><td class="ms-propertysheet" id="onetidNewColumnOption2"><br/><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_L_strGridChoice_Description%>" EncodeMethod='HtmlEncode'/>
				</td></tr>
			</table>
		</td>
		<td class="ms-authoringcontrols">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidEnterGChoice"><label for="onetidEnterGChoice123"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_typeeachsubquestiononseparate%>" EncodeMethod='HtmlEncode'/>:</label><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td>
						<textarea name="GridChoices" class="ms-long" rows="4" cols="40" wrap="off" id="onetidEnterGChoice123">
<%SPHttpUtility.WriteHtmlEncode((string)(this.GetGlobalResourceObject("wss", "fldedit_L_strRatingChoice1_Text")) + "\r\n" + (string)(this.GetGlobalResourceObject("wss", "fldedit_L_strRatingChoice2_Text")) + "\r\n" + (string)(this.GetGlobalResourceObject("wss", "fldedit_L_strRatingChoice3_Text")),this.Page);%></textarea>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td colspan="2"></td><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" height="35" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidGridChoiceValue"><label for="GridNumRange"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidGridChoiceValue%>" EncodeMethod='HtmlEncode'/>:</label><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td>
						<% int GridSelected = 5; %>
						<select name="GridNumRange" id="GridNumRange">
						  <% for (int iRng = 3; iRng <= 20; iRng++)
							 {
								 if (iRng != GridSelected) { %>
									 <option><% SPHttpUtility.WriteNoEncode(iRng,this.Page); %></option>
						  <%     }
								 else { %>
									 <option selected="selected"><% SPHttpUtility.WriteNoEncode(iRng,this.Page); %></option>
						  <%     }
							 } %>
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" height="35" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidGridChoiceValue"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidGridChoiceValue2%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td>
						<input type="text" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_GridLow_Text%>' EncodeMethod='HtmlEncode'/>" size="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_idAttrSizeLowAvgHigh%>' EncodeMethod='HtmlEncode'/>" name="GridTxtRng1" id="onetidIDGridTxtRng1" value="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_GridLow_Text%>' EncodeMethod='HtmlEncode'/>" />&#160;
						<input type="text" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_GridAverage_Text%>' EncodeMethod='HtmlEncode'/>" size="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_idAttrSizeLowAvgHigh%>' EncodeMethod='HtmlEncode'/>" name="GridTxtRng2" id="onetidIDGridTxtRng2" value="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_GridAverage_Text%>' EncodeMethod='HtmlEncode'/>" />&#160;
						<input type="text" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_GridHigh_Text%>' EncodeMethod='HtmlEncode'/>" size="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_idAttrSizeLowAvgHigh%>' EncodeMethod='HtmlEncode'/>" name="GridTxtRng3" id="onetidIDGridTxtRng3" value="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_L_GridHigh_Text%>' EncodeMethod='HtmlEncode'/>" />&#160;
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" height="35" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidGridChoiceValue"><label for="onetidShowNA"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_shownaoption%>" EncodeMethod='HtmlEncode'/></label><font size="3">&#160;</font><br />
		<SharePoint:ScriptBlock runat="server" WriteEnabled="true">
			function showNATxt()
			{
				if (document.forms[MSOWebPartPageFormName].GridShowNA.checked)
					document.getElementById("GridOptionBlock").style.display = "";
				else
					document.getElementById("GridOptionBlock").style.display = "none";
			}
		</SharePoint:ScriptBlock>
			&#160; &#160;
			<input id="onetidShowNA" onclick="showNATxt();" type="checkbox" name="GridShowNA" value="on" checked="checked" /> &#160; &#160;
			<div
id="GridOptionBlock"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_naoptiontext%>" EncodeMethod='HtmlEncode'/>&#160;<input type="text" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_naoptiontext_title%>' EncodeMethod='HtmlEncode'/>" size="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_naooptiontext_size%>' EncodeMethod='HtmlEncode'/>" name="GridNATxt" id="onetidIDGridNATxt" value="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_na%>' EncodeMethod='HtmlEncode'/>" /> </div>
					</td>
				</tr>
		</td>
	</tr>
	<%if (bShowBidiDirection) {%>
	<tr> <td colspan="2"></td> <td class="ms-authoringcontrols" height="35" width="10">&#160;</td> <td class="ms-authoringcontrols" id="onetidDirection"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_idDirection%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br /> <table border="0" cellspacing="1"> <tr> <td colspan="2" class="ms-authoringcontrols"> <select name="Direction" id="FieldDirection"> <% if ( strDirection == "None" ) { %> <option value="None" id="onetidDirNone" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="None" id="onetidDirNone"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "ltr" ) { %> <option value="ltr" id="onetidDirLTR" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="ltr" id="onetidDirLTR"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "rtl" ) { %> <option value="rtl" id="onetidDirRTL" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="rtl" id="onetidDirRTL"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> </select> </td> </tr> </table> </td> </tr>
	<%}%>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td>
		<input type="hidden" name="Default" value='' />
	</tr>
<%
break;
case "DateTime":
%>
	<!-- DateTime -->
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidDateTimeFormat"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidDateTimeFormat%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
					<% if ( strFormat == "DateOnly" ) { %> <input type="radio" name="Format" value="DateOnly" id="onetidDateOnly" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dateformatdateonly%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="radio" name="Format" value="DateOnly" id="onetidDateOnly" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dateformatdateonly%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
					</td>
					<td class="ms-authoringcontrols" id="onetidYes"><label for="onetidDateOnly"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_dateonly%>" EncodeMethod='HtmlEncode'/><!-- -->&#160; &#160;</label></td>
					<td class="ms-authoringcontrols">
					<% if ( strFormat == "DateTime" ) { %> <input type="radio" name="Format" value="DateTime" id="onetidDateTime" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dateformatdatetime%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="radio" name="Format" value="DateTime" id="onetidDateTime" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_dateformatdatetime%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
					</td>
					<td class="ms-authoringcontrols" id="onetidNo"><label for="onetidDateTime"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_datetime%>" EncodeMethod='HtmlEncode'/></label></td>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidDateTimeDisplayFormat"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidDateTimeDisplayFormat%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
					<% if ( strFriendlyFormat == "Disabled" ) { %> <input type="radio" name="FriendlyFormat" value="Disabled" id="onetidDisplayFormatNormal" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_onetidDisplayFormatStandard%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="radio" name="FriendlyFormat" value="Disabled" id="onetidDisplayFormatNormal" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_onetidDisplayFormatStandard%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
					</td>
					<td class="ms-authoringcontrols" id="onetidYes"><label for="onetidDisplayFormatNormal"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidStandard%>" EncodeMethod='HtmlEncode'/><!-- -->&#160; &#160;</label></td>
					<td class="ms-authoringcontrols">
					<% if ( strFriendlyFormat == "Relative" ) { %> <input type="radio" name="FriendlyFormat" value="Relative" id="onetidDisplayFormatFriendly" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_onetidDisplayFormatFriendly%>' EncodeMethod='HtmlEncode'/>" checked="checked" /> <% ; } else { %> <input type="radio" name="FriendlyFormat" value="Relative" id="onetidDisplayFormatFriendly" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_onetidDisplayFormatFriendly%>' EncodeMethod='HtmlEncode'/>" /> <% ; } %>
					</td>
					<td class="ms-authoringcontrols" id="onetidNo"><label for="onetidDisplayFormatFriendly"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidFriendly%>" EncodeMethod='HtmlEncode'/></label></td>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<%if (bShowCalendarUI) {%>
	<tr>
		<td colspan="2"></td>
	<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidCalendarType"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidCalendarType%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
						<% if ( bUseDefault == true ) { %> <input type="radio" name="RadioCalType" value="TRUE" id="onetidDefaultCalType" onclick="UpdateDateField()" checked="checked" /> <% ; } else { %> <input type="radio" name="RadioCalType" value="TRUE" id="onetidDefaultCalType" onclick="UpdateDateField()" /> <% ; } %><label for="onetidDefaultCalType"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidDefaultCalType%>" EncodeMethod='HtmlEncode'/><!-- -->  </label><br />
						<% if ( bUseDefault == true ) { %> <input type="radio" name="RadioCalType" value="TRUE" id="onetidCustomCalType" onclick="UpdateDateField()" /> <% ; } else { %> <input type="radio" name="RadioCalType" value="TRUE" id="onetidCustomCalType" onclick="UpdateDateField()" checked="checked" /> <% ;} %><label for="onetidCustomCalType">  <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidCustomCalType%>" EncodeMethod='HtmlEncode'/> <!-- --> </label>
						<select name="CalType" onChange="UpdateDateField()" <%if (bUseDefault) {%>disabled <%}%>>
							<% if ( iCalType == 1 ) { %> <option value="1" id="onetidcal1" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_GREGORIAN_STR%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="1" id="onetidcal1"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_GREGORIAN_STR%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
							<% if ( iCalType == 3 ) { %> <option value="3" id="onetidcal2" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_JAPAN_STR%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="3" id="onetidcal2"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_JAPAN_STR%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
							<% if (!bHideTaiwanCalendar) {%>
							<% if ( iCalType == 4 ) { %> <option value="4" id="onetidcal3" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_TAIWAN_STR%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="4" id="onetidcal3"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_TAIWAN_STR%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
							<%}%>
							<% if ( iCalType == 5 ) { %> <option value="5" id="onetidcal4" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_KOREA_STR%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="5" id="onetidcal4"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_KOREA_STR%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
							<% if ( iCalType == 6 ) { %> <option value="6" id="onetidcal2" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_HIJRI_STR%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="6" id="onetidcal2"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_HIJRI_STR%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
							<% if ( iCalType == 7 ) { %> <option value="7" id="onetidcal7" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_THAI_STR%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="7" id="onetidcal7"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_THAI_STR%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
							<% if ( iCalType == 8 ) { %> <option value="8" id="onetidcal4" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_HEBREW_STR%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="8" id="onetidcal4"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_HEBREW_STR%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
							<% if ( iCalType == 9 ) { %> <option value="9" id="onetidcal9" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_GREGORIAN_ME_FRENCH_STR%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="9" id="onetidcal9"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_GREGORIAN_ME_FRENCH_STR%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
							<% if ( iCalType == 10 ) { %> <option value="10" id="onetidcal10" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_GREGORIAN_ARABIC_STR%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="10" id="onetidcal10"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_GREGORIAN_ARABIC_STR%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
							<% if ( iCalType == 11 ) { %> <option value="11" id="onetidcal11" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_GREGORIAN_XLIT_ENGLISH_STR%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="11" id="onetidcal11"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_GREGORIAN_XLIT_ENGLISH_STR%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
							<% if ( iCalType == 12 ) { %> <option value="12" id="onetidcal2" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_GREGORIAN_XLIT_FRENCH_STR%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="12" id="onetidcal2"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_GREGORIAN_XLIT_FRENCH_STR%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
							<% if ( iCalType == 16 ) { %> <option value="16" id="onetidcal8" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_SAKA_STR%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="16" id="onetidcal8"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_SAKA_STR%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
							<% if ( iCalType == 23 ) { %> <option value="23" id="onetidcal13" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_UMMALQURA_STR%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="23" id="onetidcal13"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,regionalsetng_CAL_UMMALQURA_STR%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						</select>
					</td>
				</tr>
			</table>
		</td>
	 </tr>
	 <%}%>
	 <tr><td colspan="2"></td><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	 <tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidDefaultDateTime"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidDefaultNumberValue%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols" nowrap="nowrap">
						<input type="radio" name="Default" value="" id="onetidIONoDate" checked="checked" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvaluenone%>' EncodeMethod='HtmlEncode'/>" /><label for="onetidIONoDate"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_nodate%>" EncodeMethod='HtmlEncode'/><!-- -->  </label><br />
						<input type="radio" name="Default" value="[today]" id="onetidIOTodayDate" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvaluetoday%>' EncodeMethod='HtmlEncode'/>" /><label for="onetidIOTodayDate"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidIOTodayDate%>" EncodeMethod='HtmlEncode'/><!-- --> </label><br />
<%                      if (IsPreviewableCalType(iCalType))
						{
%>
						<input type="radio" name="Default" value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(strDefault),this.Page);%> id="onetidIOLiteralDefaultDate" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvalueenterdate%>' EncodeMethod='HtmlEncode'/>" />
						<span  id="idDateContainer" onmousedown = "CheckDPRadioButton(1)" onkeydown="CheckDPRadioButton(2)"><SharePoint:ScriptBlock runat="server" WriteEnabled="true">
							function CheckDPRadioButton(intType) {
								if(intType==1)
										document.forms[MSOWebPartPageFormName].Default[2].checked = true;
								else
									if(event.keyCode != 9)
										document.forms[MSOWebPartPageFormName].Default[2].checked = true;
							}
							var frm = helperFrm;
							var defaultDate = document.forms[MSOWebPartPageFormName].Default[2].value;
							var strDefFmla = <%SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(strDefaultFormula),this.Page); %>;
							if (strDefFmla != "")
							{
								g_fld = new DateField(frm,"Date",L_alert7_Text,"");
							} else if (defaultDate == "") {
								document.forms[MSOWebPartPageFormName].Default[0].checked = true;
								g_fld = new DateField(frm,"Date",L_alert7_Text,"");
							} else if (defaultDate == "[today]") {
								document.forms[MSOWebPartPageFormName].Default[1].checked = true;
								g_fld = new DateField(frm,"Date",L_alert7_Text,"");
							} else {
								document.forms[MSOWebPartPageFormName].Default[2].checked = true;
								g_fld = new DateField(frm,"Date",L_alert7_Text,defaultDate);
							}
							g_fld.frm.stImagesPath += "/_layouts/15/images/";
							g_fld.caltype = <%SPHttpUtility.WriteNoEncode(iCalType,this.Page);%>;
							g_fld.showDatePicker = false;
							<%if (Web != null && SPUtility.IsRightToLeft(Web, Web.Language)) {%>
								g_fld.direction = "rtl";
				<%}%>
							g_fld.BuildUI();
						</SharePoint:ScriptBlock></span><br />
<%                      }
						else
						{
%>
							<SharePoint:ScriptBlock runat="server" WriteEnabled="true">
							var defaultDate = <%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(strDefault),this.Page);%>;
							if (defaultDate == "[today]") {
								document.forms[MSOWebPartPageFormName].Default[1].checked = true;
							} else {
								document.forms[MSOWebPartPageFormName].Default[0].checked = true;
							}
							</SharePoint:ScriptBlock>
<%                      }
%>
						<input type="radio" name="Default" value="" id="onetidIOLiteralDefaultFormula" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvaluecal%>' EncodeMethod='HtmlEncode'/>" /><label for="onetidIOLiteralDefaultFormula">  <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidCalcNumberValue2%>" EncodeMethod='HtmlEncode'/>:</label><br />
						<table border="0" cellspacing="1">
							<tr>
								<td><input class="ms-input" id="onetidIODefTextValue03" type="text" maxlength=355 name="DefaultFormula" value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(strDefaultFormula),this.Page);%>
<%                      if (IsPreviewableCalType(iCalType))
						{
%>                              onclick="document.forms[MSOWebPartPageFormName].Default[3].checked = 1;"
<%                      }
						else
						{
%>                              onclick="document.forms[MSOWebPartPageFormName].Default[2].checked = 1;"
<%                      }
%>                              title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvaluecal%>' EncodeMethod='HtmlEncode'/>"/></td>
							</tr>
						</table>
						<SharePoint:ScriptBlock runat="server" WriteEnabled="true">
						  var strDefFmla = <%SPHttpUtility.WriteAddQuote(SPHttpUtility.EcmaScriptStringLiteralEncode(strDefaultFormula),this.Page); %>;
						  if (strDefFmla != "")
						  {
<%                          if (IsPreviewableCalType(iCalType))
							{
%>                           document.forms[MSOWebPartPageFormName].Default[3].checked = true;
<%                          }
							else
							{
%>                           document.forms[MSOWebPartPageFormName].Default[2].checked = true;
<%                          }
%>                        }
						</SharePoint:ScriptBlock>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<%if (bShowBidiDirection) {%>
	<tr> <td colspan="2"></td> <td class="ms-authoringcontrols" height="35" width="10">&#160;</td> <td class="ms-authoringcontrols" id="onetidDirection"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_idDirection%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br /> <table border="0" cellspacing="1"> <tr> <td colspan="2" class="ms-authoringcontrols"> <select name="Direction" id="FieldDirection"> <% if ( strDirection == "None" ) { %> <option value="None" id="onetidDirNone" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="None" id="onetidDirNone"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "ltr" ) { %> <option value="ltr" id="onetidDirLTR" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="ltr" id="onetidDirLTR"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "rtl" ) { %> <option value="rtl" id="onetidDirRTL" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="rtl" id="onetidDirRTL"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> </select> </td> </tr> </table> </td> </tr>
	<%}%>
<%
break;
case "Text":
%>
	<!-- Text -->
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidTextMaxChar"><label for="idMaxLength"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidTextMaxChar%>" EncodeMethod='HtmlEncode'/>:</label><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td colspan="2"><SharePoint:ScriptBlock runat="server" WriteEnabled="true">g_fld = new NumberField(helperFrm,"MaxLength",L_alert10_Text, "<% if (iMaxLength != int.MaxValue) SPHttpUtility.WriteNoEncode(iMaxLength, this);%>");g_fld.wMin = "1";g_fld.wMax = "255";g_fld.fInteger = true;g_fld.BuildUI();</SharePoint:ScriptBlock></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr><td colspan="2"></td><td class="ms-authoringcontrols" colspan="2" height="6"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" height="35" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidDefaultTextValue">
			<label for="onetidIODefTextValue"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidDefaultNumberValue%>" EncodeMethod='HtmlEncode'/></label>
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
						<input type="radio" name="Default" value="" id="onetidIONoDate" <% if (fDefaultFormulaEmpty) SPHttpUtility.WriteNoEncode(strCheckedLiteral, this);%> title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvaluetext%>' EncodeMethod='HtmlEncode'/>" />
					</td>
					<td class="ms-authoringcontrols">
						<label for="onetidIONoDate"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_text%>" EncodeMethod='HtmlEncode'/></label>
					</td>
					<td class="ms-authoringcontrols">
						<input type="radio" name="Default" value="" id="onetidIOLiteralDefaultFormula02" <% if (!fDefaultFormulaEmpty) SPHttpUtility.WriteNoEncode("CHECKED", this);%> title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvaluecal%>' EncodeMethod='HtmlEncode'/>" />
					</td>
					<td class="ms-authoringcontrols">
						<label for="onetidIOLiteralDefaultFormula02"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_onetidCalcNumberValue2%>" EncodeMethod='HtmlEncode'/></label>
					</td>
			   </tr>
			</table>
			<table border="0" cellspacing="1">
				<tr>
					<td colspan="2"><input class="ms-input" id="onetidIODefTextValue" type="text" maxlength="255" name="DefaultText" value=<% if (fDefaultFormulaEmpty) SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(strDefault),this.Page); else SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(strDefaultFormula),this.Page);%> title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_defaultvalue%>' EncodeMethod='HtmlEncode'/>" /></td>
			   </tr>
			</table>
		</td>
	</tr>
	<%if (bShowBidiDirection) {%>
	<tr> <td colspan="2"></td> <td class="ms-authoringcontrols" height="35" width="10">&#160;</td> <td class="ms-authoringcontrols" id="onetidDirection"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_idDirection%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br /> <table border="0" cellspacing="1"> <tr> <td colspan="2" class="ms-authoringcontrols"> <select name="Direction" id="FieldDirection"> <% if ( strDirection == "None" ) { %> <option value="None" id="onetidDirNone" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="None" id="onetidDirNone"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "ltr" ) { %> <option value="ltr" id="onetidDirLTR" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="ltr" id="onetidDirLTR"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "rtl" ) { %> <option value="rtl" id="onetidDirRTL" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="rtl" id="onetidDirRTL"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> </select> </td> </tr> </table> </td> </tr>
	<%}%>
<%
break;
}
}
else
{
	if (bShowBidiDirection) {%>
	<tr> <td colspan="2"></td> <td class="ms-authoringcontrols" height="35" width="10">&#160;</td> <td class="ms-authoringcontrols" id="onetidDirection"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_idDirection%>" EncodeMethod='HtmlEncode'/><font size="3">&#160;</font><br /> <table border="0" cellspacing="1"> <tr> <td colspan="2" class="ms-authoringcontrols"> <select name="Direction" id="FieldDirection"> <% if ( strDirection == "None" ) { %> <option value="None" id="onetidDirNone" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="None" id="onetidDirNone"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_none%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "ltr" ) { %> <option value="ltr" id="onetidDirLTR" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="ltr" id="onetidDirLTR"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_lefttoright%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> <% if ( strDirection == "rtl" ) { %> <option value="rtl" id="onetidDirRTL" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="rtl" id="onetidDirRTL"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_righttoleft%>" EncodeMethod='HtmlEncode'/></option> <% ; } %> </select> </td> </tr> </table> </td> </tr>
	<%}
}
%>
<%
	if (bShowIME && !bSealed
		&& FieldTypeName !="Lookup" && FieldTypeName!="DateTime" && FieldTypeName != "GridChoice"
		&& FieldTypeName != "Calculated" && FieldTypeName != "Number"
		&& FieldTypeName != "Currency" && FieldTypeName != "User" && FieldTypeName != "Boolean"
		&& !(FieldTypeName == "Note" && bRichText == true) && strField != "PageSeparator")
	{
%>
	<tr>
		<td colspan="2"></td>
		<td class="ms-authoringcontrols" height="35" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidDirection"><label for="idIMEMode"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_imprefence%>" EncodeMethod='HtmlEncode'/></label><font size="3">&#160;</font><br />
			<table border="0" cellspacing="1">
				<tr>
					<td class="ms-authoringcontrols">
						<select name="IMEMode" id="idIMEMode">
					<% if ( strIMEMode == "active" ) { %> <option value="active" id="onetidActive" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_on%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="active" id="onetidActive"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_on%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
					<% if ( strIMEMode == "inactive" ) { %> <option value="inactive" id="onetidInactive" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_off%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="inactive" id="onetidInactive"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_off%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
					<% if ( strIMEMode == "" ) { %> <option value="" id="onetidDirRTL" selected="selected"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_nocontrol%>" EncodeMethod='HtmlEncode'/></option> <%; } else { %> <option value="" id="onetidDirRTL"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_nocontrol%>" EncodeMethod='HtmlEncode'/></option> <% ; } %>
						</select>
					</td>
				</tr>
			</table>
		</td>
	</tr>
<% } %>
<%
if (spList == null && !string.IsNullOrEmpty(ContentTypeId))
{
%>
<!-- Push Down Settings -->
	<div id="PushDownSection" runat="server">
	<tr><td colspan="2">&#160;</td><td class="ms-authoringcontrols" colspan="2" height="21">&#160;</td></tr>
	<tr><td class="ms-sectionline" height="1" colspan="4"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td nowrap="nowrap"></td>
		<td class="ms-descriptiontext ms-formdescriptioncolumn-wide" valign="top">
			<table border="0" cellpadding="1" cellspacing="0">
				<tr><td height="28" valign="top" class="ms-sectionheader"><h3 class="ms-standardheader"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,ctypedit_pushdown_header%>" EncodeMethod='HtmlEncode'/></h3></td></tr>
				<tr><td class="ms-propertysheet"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,ctypedit_pushdown_description%>" EncodeMethod='HtmlEncode'/></td></tr>
			</table>
		</td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols">
			<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,ctypedit_pushdown_instruction%>" EncodeMethod='HtmlEncode'/><br />
			<table border="0" cellpadding="1" cellspacing="0">
			<tr>
				<td valign="top" class="ms-authoringcontrols">
					<input type="radio" id="RadPushDownYes" name="GrpPushDown" value="1" checked="true" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_update_yes%>' EncodeMethod='HtmlEncode'/>"/>
					<label for="RadPushDownYes"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_pushdown_yes%>" EncodeMethod='HtmlEncode'/></label><br />
				</td>
				<td valign="top" class="ms-authoringcontrols">
					<input type="radio" id="RadPushDownNo" name="GrpPushDown" value="0" title="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,fldedit_update_no%>' EncodeMethod='HtmlEncode'/>"/>
					<label for="RadPushDownNo"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_pushdown_no%>" EncodeMethod='HtmlEncode'/></label><br />
				</td>
			</tr>
			</table>
		</td>
	  </tr>
	  </div>
<%
}
%>
<!--Branching settings -->
	<tr><td colspan="2">&#160;</td><td class="ms-authoringcontrols" colspan="2" height="21">&#160;</td></tr>
	<tr><td class="ms-sectionline" height="1" colspan="4"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td nowrap="nowrap"></td>
		<td class="ms-descriptiontext ms-formdescriptioncolumn-wide" valign="top" id="align03">
			<table border="0" cellpadding="1" cellspacing="0">
				<tr><td height="28" valign="top" class="ms-sectionheader" id="onetidNewColumnOption"><h3 class="ms-standardheader"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,survey_branching%>" EncodeMethod='HtmlEncode'/></h3></td></tr>
				<tr><td class="ms-propertysheet" id="onetidNewColumnOption2"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,survey_branching_settings%>" EncodeMethod='HtmlEncode'/>
				<SharePoint:FormattedString id="helptopic_WSSEndUser_SurveyBranching" FormatText="<%$Resources:wss,helptopic_link%>" EncodeMethod="NoEncode" runat="server"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,CSH_SurveyBranching%>" EncodeMethod='HtmlEncode'/> <SharePoint:EncodedLiteral runat="server" text='WSSEndUser_SurveyBranching' EncodeMethod='EcmaScriptStringLiteralEncode'/> </SharePoint:FormattedString></td></tr>
			</table>
		</td>
		<td class="ms-authoringcontrols" width="10">&#160;</td>
		<td class="ms-authoringcontrols" id="onetidBranching">
<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,survey_branching_advertise%>" EncodeMethod='HtmlEncode'/>
		</td>
	</tr>
	<tr><td colspan="2">&#160;</td><td class="ms-authoringcontrols" colspan="2" height="21">&#160;</td></tr>
	<!-- Validation -->
<%
	string strValidationSectionStyle = "";
		string strValidationSettingsStyle = " style='display: none'";
		string strValidationImgSrc = "/_layouts/15/images/plus.gif?rev=40";
		if (!String.IsNullOrEmpty(VldFormula.Text) || !String.IsNullOrEmpty(VldMessage.Text))
		{
			strValidationSettingsStyle = "";
			strValidationImgSrc = "/_layouts/15/images/minus.gif?rev=40";
		}
		switch (FieldTypeName)
		{
			case "Choice":
			case "Currency":
			case "DateTime":
			case "Integer":
			case "Number":
			case "Text":
%>
			<tbody id="ValidationSection"<%SPHttpUtility.WriteNoEncode(strValidationSectionStyle,this.Page);%>>
			<tr><td class="ms-sectionline" height="1" colspan="4"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
			<tr>
				<td class="ms-sectionheader" height="28" colspan="2">
					<h3 class="ms-standardheader">
						<a href="javascript:toggleValidationSettings()">
							<img id="ValidationImg" src=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.NoEncode(strValidationImgSrc),this.Page);%> border="0" alt="" />&#160; <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_validation_title%>" EncodeMethod='HtmlEncode'/>
						</a>
					</h3>
				</td>
				<td class="ms-authoringcontrols" colspan="2" height="28">&#160;</td>
			</tr>
			</tbody>
			<tbody id="ValidationSettings"<%SPHttpUtility.WriteNoEncode(strValidationSettingsStyle,this.Page);%>>
			<tr class="ms-descriptiontext">
				<td nowrap="nowrap"></td>
				<td class="ms-descriptiontext ms-formdescriptioncolumn-wide" valign="top">
					<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_validation_formula_desc%>" EncodeMethod='HtmlEncode'/>
					<p/>
					<SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_validation_formula_example%>" EncodeMethod='HtmlEncode'/>
					<p/>
					<SharePoint:FormattedString id="helptopic_WSSEndUser_FormulaSyntaxError" FormatText="<%$Resources:wss,helptopic_link%>" EncodeMethod="NoEncode" runat="server"> <SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,CSH_FormulaSyntaxHelp%>" EncodeMethod='HtmlEncode'/> <SharePoint:EncodedLiteral runat="server" text='WSSEndUser_FormulaSyntaxError' EncodeMethod='EcmaScriptStringLiteralEncode'/> </SharePoint:FormattedString>
				</td>
				<td class="ms-authoringcontrols" width="10">&#160;</td>
				<td class="ms-authoringcontrols"><label for="VldFormula"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_formula%>" EncodeMethod='HtmlEncode'/></label><font size="3">&#160;</font><br />
					<table border="0" cellspacing="1">
						<tr>
							<td colspan="2">
								<wssawc:InputFormTextBox title="<%$Resources:wss,vldsetng_formula_title%>" class="ms-input" ID="VldFormula" Runat="server" TextMode="MultiLine" Columns="40" Rows="8" MaxLength=1024 />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr><td colspan="2">&#160;</td><td class="ms-authoringcontrols" colspan="2" height="21">&#160;</td></tr>
			<tr>
				<td nowrap="nowrap"></td>
				<td class="ms-descriptiontext ms-formdescriptioncolumn-wide" valign="top">
					<table border="0" cellpadding="1" cellspacing="0">
						<tr><td class="ms-descriptiontext"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_validation_message_desc%>" EncodeMethod='HtmlEncode'/></td></tr>
					</table>
				</td>
				<td class="ms-authoringcontrols" width="10">&#160;</td>
				<td class="ms-authoringcontrols"><label for="VldMessage"><SharePoint:EncodedLiteral runat="server" text="<%$Resources:wss,fldedit_validation_message_label%>" EncodeMethod='HtmlEncode'/></label><font size="3">&#160;</font><br />
					<table border="0" cellspacing="1">
						<tr>
							<td colspan="2">
								<wssawc:InputFormTextBox title="<%$Resources:wss,fldedit_validation_message_label%>" class="ms-input" ID="VldMessage" Runat="server" TextMode="MultiLine" Columns="40" Rows="2" MaxLength=1024 />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr><td colspan="2">&#160;</td><td class="ms-authoringcontrols" colspan="2" height="21">&#160;</td></tr>
			</tbody>
<%
			break;
	}
%>
<%
%>
<%
showSubmitButtons:
%>
<!--OK/Cancel-->
	<tr><td class="ms-sectionline" height="2" colspan="4"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td></tr>
	<tr>
		<td class="ms-spaceBetContentAndButton" colspan="2"><img src="/_layouts/15/images/blank.gif?rev=40" width='1' height='1' alt="" data-accessibility-nocheck="true"/></td>
	</tr>
<tr><td colspan='4'> <table cellpadding="0" cellspacing="0" width="100%"> <colgroup> <col width="99%" /> <col width="1%"/> </colgroup> <tr> <td>&#160;</td> <td nowrap="nowrap" align="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,multipages_direction_right_align_value%>' EncodeMethod='HtmlEncode'/>">
		<img id="ImageProgress" class="ms-verticalAlignMiddle" src="/_layouts/15/images/loadingcirclests16.gif?rev=40" style="display:none;" onclick="javascript:this.style.display='none';"/>
		<%
		bool questionExists = false;
		if (spFields != null)
		{
			foreach (SPField spField in spFields)
			{
				if (Enum.IsDefined(typeof(SPFieldType), spField.TypeAsString) && spField.Type == SPFieldType.Choice) {
					questionExists = true;
					break;
				}
			}
		}

		if (!questionExists) {
		%>
			<input class="ms-ButtonHeightWidth" id="onetidSaveItem" accesskey="i" type="button" value="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,multipages_finishbutton_text%>' EncodeMethod='HtmlEncode'/>" onclick="SubmitPage(false, this);"/>
			<span id="idSpace" class="ms-SpaceBetButtons"></span>
		<%
		} 
		else {
			SPUtility.TransferToSuccessPage(SPUtility.GetLocalizedString("$Resources:XnetSPKolektor,ErrQP_JustOneQuestion", "XnetSPKolektor", SPContext.Current.Web.Language), HttpUtility.ParseQueryString(SPUtility.GetFullUrl(SPContext.Current.Site, SPUtility.OriginalServerRelativeRequestUrl)).Get("source").Replace(SPContext.Current.Web.Url, ""), null, null);
		}
		%>
		<input class="ms-ButtonHeightWidth" id="onetidCancelItem" accesskey=c Type="button" Value="<SharePoint:EncodedLiteral runat='server' text='<%$Resources:wss,multipages_cancelbutton_text%>' EncodeMethod='HtmlEncode'/>"
			   onclick="if(typeof window.parent.STSNavigate != 'undefined') window.parent.STSNavigate('SurvEdit.aspx?<%=strContainerParam%>'); else window.parent.location.href = 'SurvEdit.aspx?<%=strContainerParam%>';return false;" />
</td> </tr> </table> </td></tr>
	<tr>
	 <td colspan="4" height="60" class="s4-notdlg">&#160;</td>
	</tr>
</table>
</td>
<td width="10px">&#160;</td>
</tr>
<!--End form's table-->
</table>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderUtilityContent" runat="server">
<form  name="frmSubmit" METHOD="POST" ACTION="placeholder">
	<input type="hidden" name="FieldName"        value='' />
	<input type="hidden" name="FieldXML"         value='' />
	<input type="hidden" name="AddToDefaultView" value='NO'  />
	<input type="hidden" name="AddToAllContentTypes" value='NO' />
	<input type="hidden" name="owshiddenversion" value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.NoEncode(Version),this.Page);%> />
	<input type="hidden" name="View" value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(Request.QueryString["View"]),this.Page);%> />
	<input type="hidden" name="RelativeToField" value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(Request.QueryString["RelativeToField"]),this.Page);%> />
	<input type="hidden" name="LTR" value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(Request.QueryString["LTR"]),this.Page);%> />
	<input type="hidden" name="PushDown"         value='NO' />
	<input type="hidden" id="fldeditgutsNextUsing" name="NextUsing" value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(strNextUsing),this.Page);%> />
	<input type="hidden" name="FieldInUse" value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.NoEncode(cFieldUsage),this.Page);%> />
	<input type="hidden" name="CTypeId" value=<%SPHttpUtility.WriteAddQuote(SPHttpUtility.HtmlEncode(ContentTypeId),this.Page);%> />
	<SharePoint:FormDigest runat=server ForceRender="true"/>
</form>
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
