#$PasswordForUsers is the inital password without secure string # 

$PasswordForUsers = “Password123”
$UserNamesList = Get-Content .\names.txt


$password = ConvertTo-SecureString $PasswordForUsers -AsPlainText -Force

New-ADOrganisationalUnit -Name _USERS
