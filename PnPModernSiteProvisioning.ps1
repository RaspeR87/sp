Install-Module SharePointPnPPowerShellOnline
#Update-Module SharePointPnPPowerShellOnline

####################################### Disable "modern page" experience ##########################################

$cred = Get-Credential
Connect-PnPOnline -Url https://rr87.sharepoint.com/sites/IT -Credentials $cred
# Prevent site pages at web level
Disable-PnPFeature -Identity B6917CB1-93A0-4B97-A84D-7CF49975D4EC -Scope Web 
# And again enable site pages at web
Enable-PnPFeature -Identity B6917CB1-93A0-4B97-A84D-7CF49975D4EC -Scope Web 

####################################### Commenting configuration ##################################################

#Microsoft.Online.SharePoint.TenantAdministration.SiteProperties.CommentsOnSitePagesDisabled
#Microsoft.SharePoint.Client.Site.CommentsOnSitePagesDisabled

####################################### Adding "modern" pages #####################################################

$cred = Get-Credential
Connect-PnPOnline -Url https://rr87.sharepoint.com/sites/IT -Credentials $cred

Add-PnPClientSidePage -Name "Test Site"
Add-PnPClientSidePageSection -Page "Test Site" -SectionTemplate ThreeColumn
Add-PnPClientSideWebPart -Page "Test Site" -DefaultWebPartType BingMap  

####################################### Save "modern" pages to XML ################################################

$cred = Get-Credential
Connect-PnPOnline -Url https://rr87.sharepoint.com/sites/IT -Credentials $cred

Get-PnPProvisioningTemplate -Out "C:\Temp\template.xml" -Handlers PageContents

####################################### Load "modern" pages from XML ##############################################

$cred = Get-Credential
Connect-PnPOnline -Url https://rr87.sharepoint.com/sites/ITCopy -Credentials $cred

Apply-PnPProvisioningTemplate C:\Temp\template.xml