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
    $username = "$($first.Substring(0,1))$($last)".ToLower()
       
    New-AdUser -AccountPassword $password `
               -GivenName $first `
               -Surname $last `
               -DisplayName $username `
               -Name $username `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "ou=_USERS,$(([ADSI]`"").distinguishedName)" `
               -Enabled $true
}

    }