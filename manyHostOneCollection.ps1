 $collection = "Mozilla Firefox"
 $hostnames = Get-Content "C:\Users\E33782\Documents\Scripts\hostnamesToAdd.txt"
    
    foreach($hostname in $hostnames) { 
            try{
                Write-Host “Adding $hostname to $collection” -ForegroundColor Green
                Get-CMCollection -Name "Adobe Acrobat DC" | Add-CMDeviceCollectionDirectMembershipRule -ResourceId (Get-CMDevice -Name $hostname).ResourceID
                Invoke-CMClientAction -DeviceName $hostname -ActionType ClientNotificationRequestMachinePolicyNow
                Invoke-CMClientAction -DeviceName $hostname -ActionType ClientNotificationRequestSWInvNow
            } catch {
                Write-Error "Could not add $hostname to $collection. Computer may be offline or doesn't exist."
            }
    }

    Invoke-CMCollectionUpdate -Name $collection

# SIG # Begin signature block
# MIIFlAYJKoZIhvcNAQcCoIIFhTCCBYECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUpw30V+CRbIX0P8tdg4c65pJ3
# 9r2gggMiMIIDHjCCAgagAwIBAgIQFnkdFcpIsKNKSQrJMUKUqTANBgkqhkiG9w0B
# AQsFADAnMSUwIwYDVQQDDBxQb3dlclNoZWxsIENvZGUgU2lnbmluZyBDZXJ0MB4X
# DTIzMDgwNDE0NDkyOVoXDTI0MDgwNDE1MDkyOVowJzElMCMGA1UEAwwcUG93ZXJT
# aGVsbCBDb2RlIFNpZ25pbmcgQ2VydDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
# AQoCggEBALskqUsP34fLiBICwTPDhIhR7hfNV9CqY2QkfAwqX5tjtjreIT2R25r2
# s0BvGlt0YndHrNtPnNu0i2n+Y2RJKf4ukV4Ymx8X9krTNqIOxTnTykGbweL82TZS
# 2DYkTj9L7+MsQTqpEFD7SIYV2JN6Es12moKF03xaBjxC1Hm2hxXU66Ja0WfaKl5W
# 1WqZdEZQicYYB5l2OwgZrSPPcq2S9S4eA5oqroB2WxVGhm+IKslSxYAYLyv91z2q
# TcHUvhT7yx4tDlzL6wQ1wVSDe2iYEQCesB7LaVnBWmyuSa8WujwqRj227TDqzZa+
# B80AL3GzgTReK4xqntrjXHDGAATAJ/ECAwEAAaNGMEQwDgYDVR0PAQH/BAQDAgeA
# MBMGA1UdJQQMMAoGCCsGAQUFBwMDMB0GA1UdDgQWBBRKXcjGdu3GhSzJOs3UewFo
# BYHjwjANBgkqhkiG9w0BAQsFAAOCAQEAh/EIk2b2Le4+5orIn9rjh501/0mhXoyT
# Q4ebUzNJj9cuip4axiOLgAqpF9Vatk+bjsJbWTEnVwzBlxgaIa2YH3QfZKQY6L/C
# MCJ5OgPjKYmhYHPQQK8QPHH/KW0G6S2Oq8+LIDX/d98FhvK82CKAVjinTiMIKLzE
# S4iBh8rRB4WpaxljusxMdRzSMUJIc/ezRnHTXOiyyHkm3ueL31XJ4p/vHx2zwTt4
# cl1BEwVv50f32iEooiDMFs1zBRTlm1KBDS+pNMECTXpDB/c1cZzwEU9ySnejotcY
# J82wInl9T5ppdi3gQ7sBq2S+0KMHe5LmObVLNhWUNq/IYbtrg1oRQTGCAdwwggHY
# AgEBMDswJzElMCMGA1UEAwwcUG93ZXJTaGVsbCBDb2RlIFNpZ25pbmcgQ2VydAIQ
# FnkdFcpIsKNKSQrJMUKUqTAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAig
# AoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUGwZfZxPN+1RzIybGFCfC
# O/3JR14wDQYJKoZIhvcNAQEBBQAEggEALVCWcfaRr2V9VqXcQTF/Y5noLzAT8oII
# uMXiwPZ/aAprCLEGyf1KXY7Fen+pMKU0PZdqWhG9s4Ss4Tc3cTzqHcdLeWdnYSt2
# h3GYts5r1JHzOKqK5zOsK8XNfFdqlhJtYMC9tY7hWcQRqVcz0Cd1BhS19g+nFzeq
# vPvJ1BCtxxUIdE80DhMgRlNC3y8QuuIdnitZdXigXKbLWe4G0wRyHpABJtcYXffO
# /7Qmmkf9RcWXCue7LS7YhBeAa1zXKAcdseivySNfSnnXxXtu8hkvGaOeNAseADHf
# zAVPlJF+WGuYBrd85LTLLE+wiWUlnwFO3XUp7Byw9afq+cr8m2C0MA==
# SIG # End signature block
