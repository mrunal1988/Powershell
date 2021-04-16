$computerNames = @("Desktop1", "Desktop2", "Desktop3")
$appName = "VideoLAN"
$yourAccount = Get-Credential
ForEach ($computerName in $computerNames) {
    Invoke-Command -ComputerName $computerName -Credential $yourAccount -ScriptBlock {
        Get-WmiObject Win32_product | Where {$_.name -eq $appName} | ForEach {
            $_.Uninstall()
        }
    }
}
