﻿Some deployment scripts need to check if certain required software is installed on a Windows Machine. You could check if a specific file is present at a certain location, but there is a better way: the uninstall database in the Windows Registry!

PowerShell makes it really easy to query the registry using Get-ItemProperty. The path you want to query is HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*.

Example: is .Net Core 3.1 Runtime installed?
Let’s check:

$software = "Microsoft .NET Core Runtime - 3.1.0 (x64)";
$installed = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $software }) -ne $null

If(-Not $installed) {
	Write-Host "'$software' NOT is installed.";
} else {
	Write-Host "'$software' is installed."
}

$fileExe = "T:\SQLEXPRADV_x64_ENU.exe"
$CONFIGURATIONFILE = "T:\ConfSetupSql2008Express.ini"

& $fileExe  /CONFIGURATIONFILE=$CONFIGURATIONFILE
share  improve this answer  follow
edited Sep 19 '13 at 4:13

Adi Inbar
10.4k1111 gold badges4343 silver badges6464 bronze badges
answered Jan 10 '11 at 13:24

nonolde1er
64555 silver badges22 bronze badges
add a comment

53

I had spaces in both command and parameters, and this is what worked for me:

$Command = "E:\X64\Xendesktop Setup\XenDesktopServerSetup.exe"
$Parms = "/COMPONENTS CONTROLLER,DESKTOPSTUDIO,DESKTOPDIRECTOR,LICENSESERVER,STOREFRONT /PASSIVE /NOREBOOT /CONFIGURE_FIREWALL /NOSQL"

$Prms = $Parms.Split(" ")
& "$Command" $Prms