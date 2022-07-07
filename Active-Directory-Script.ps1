#$PasswordForUsers is the inital password without secure string # 

$PasswordForUsers = “Password123”
$UserNamesList = Get-Content .\names.txt


$password = ConvertTo-SecureString $PasswordForUsers -AsPlainText -Force


# Creates an OrganisationalUnit named Users
New-ADOrganisationalUnit -Name _USERS


# Splitting of the names into sub-strings
foreach ($n in $UserNamesList) {
    $first = $n.Split(" ")[0].ToLower()
    $last = $n.Split(" ")[1].ToLower()
           

    }