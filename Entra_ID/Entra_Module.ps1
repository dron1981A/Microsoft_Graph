#The graph module
Install-Module microsoft.graph -Scope CurrentUser -Force -Verbose

#Get infos
Get-Module -ListAvailable | Where-Object { $_.Name -like 'Microsoft.Graph.*' }
Get-Command -module microsoft.graph.Users | Select-Object -Unique Noun | Sort-Object Noun

#Install the module Entra PowerShell module
Install-Module Microsoft.Graph.Entra -AllowPrerelease -Repository PSGallery -Force -Verbose

Update-Module -Name Microsoft.Graph.Entra -AllowPrerelease #keep up-to-date

Get-Module microsoft.graph.entra

#If you want the Beta version
Install-Module Microsoft.Graph.Entra.Beta -AllowPrerelease -Repository PSGallery -Force

#Connect to your tenant
Connect-MgGraph -Scopes 'User.Read.All'

#Or use
Connect-Entra -Scopes 'User.Read.All'

#Check current consented scopes
(Get-MgContext).Scopes

#View the objects supported by the Entra module
Get-Command -Module microsoft.graph.entra | Select-Object -Unique Noun | Sort-Object Noun

Get-EntraUser -SearchString "Harry" | Format-Table DisplayName, Mail

#To see more detail, the REST call etc
Get-EntraUser -SearchString "Harry" -Debug


#No pipelining :-(
Get-MgGroup -Filter "DisplayName eq 'Bitcoin Traders'" | Get-MgGroupMember

#Yay!
Get-EntraGroup -Filter "DisplayName eq 'Bitcoin Traders'" | Get-EntraGroupMember | Format-Table DisplayName, city


#Alias
Enable-EntraAzureADAlias
Get-Alias -Name *AzureAD*
Get-Alias -Definition Get-EntraUser

Get-AzureADUser -SearchString "Harry" | Format-Table DisplayName, Mail
