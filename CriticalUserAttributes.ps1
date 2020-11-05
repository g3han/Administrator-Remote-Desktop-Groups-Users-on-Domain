Get-ADUser -Filter * -Properties badPwdCount,mail,badPasswordTime,lastLogon,lastLogonTimestamp,logonCount,pwdLastSet,whenCreated,Enabled | Select-Object samAccountName, mail, Enabled, BadPwdCount, @{n='badPasswordTime';e={[DateTime]::FromFileTime($_.badPasswordTime)}}, @{n='lastLogon';e={[DateTime]::FromFileTime($_.lastLogon)}}, @{n='lastLogonTimestamp';e={[DateTime]::FromFileTime($_.lastLogonTimestamp)}}, logonCount, @{n='pwdLastSet';e={[DateTime]::FromFileTime($_.pwdLastSet)}}, whenCreated | Export-Csv -Path C:\temp\CriticalUserAttributes.csv -Delimiter ';' -NoTypeInformation
