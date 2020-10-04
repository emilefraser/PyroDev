﻿$vs2019_link_url = "https://download.visualstudio.microsoft.com/download/pr/067fd8d0-753e-4161-8780-dfa3e577839e/724cca621dac0508805a667e36d1a82cafe3fcd05ad79194b45bb5ae01ec8fec/vs_Enterprise.exe"
$build2019_link_url ="https://download.visualstudio.microsoft.com/download/pr/067fd8d0-753e-4161-8780-dfa3e577839e/91e449a6b736cda31d94613f6d88668825e8b0b43f8b041d22b3a3461b23767f/vs_BuildTools.exe"
$download_path ="c:\\env\\vs2019\\installer"

# $currentPath =  $env:Path
# $currentPath -split ';'

# $aa = Get-Command aria2cddasd | Select-Object "Source"
# $aa

if ([System.IO.File]::Exists("c:\bin\download\aria2c.exe"))
{
    [System.Console]::WriteLine("exists");
}
else
{
    [System.Console]::WriteLine("does not exist");
    Invoke-WebRequest -Uri "https://github.com/aria2/aria2/releases/download/release-1.35.0/aria2-1.35.0-win-64bit-build1.zip" -OutFile "C:\bin\downloads"

}


aria2c -c -d $download_path $vs2019_link_url
aria2c -c -d $download_path $build2019_link_url


vs_community.exe --layout "download-path" --lang "download-language"
3	Example A: Install all languages
vs_community.exe --layout C:\vs2019
4	Example B: Install one language
c:\env\vs2019\installer\vs_Enterprise.exe --layout C:\\env\\vs2019 --lang en-US
5	Example C: Install multiple languages
vs_community.exe --layout C:\vs2019 --lang en-US de-DE ja-JP


# Listing environment variables with GetEnvironmentVariable in each scope
# System.Environment]::GetEnvironmentVariables('User')
# [System.Environment]::GetEnvironmentVariables('Machine')
#  [System.Environment]::GetEnvironmentVariables('Process')

# # The same as Process
# PS51> [System.Environment]::GetEnvironmentVariables()

# aria2c -c -d $download_path $vs2019_link_url
# aria2c -c -d $download_path $build2019_link_url

#wget http://blog.stackexchange.com/ -OutFile out.html
#Note that:
#wget is an alias for Invoke-WebRequest
# $client = New-Object System.Net.WebClient
# $client.DownloadFile($url, $path)

# Download a file over HTTP/S
# Invoke-WebRequest -Uri http://url.com/path/to/file.ext -OutFile \\path\to\local\file.ext
# Transfer a file over S/FTP
# $source = "ftp://ftp.url.com/file.ext" $destination = "C:\directory\file.ext"  Invoke-WebRequest $source -OutFile $destination -Credential ftpuseraccount
# Resuming a partial download
# Invoke-WebRequest -Uri http://url.com/path/to/file.ext -Resume -OutFile \\path\to\local\file.ext
# Resolve shortened URLs
# $Uri = 'short-url/extension'  $Web = Invoke-WebRequest -Uri $Uri -UseBasicParsing  $Web.BaseResponse.ResponseUri.AbsoluteUri
# Scrape links from a website
# (Invoke-WebRequest -Uri "https://techrepublic.com").Links.Href
# Request data from a website impersonating a browser
# Invoke-WebRequest -Uri http://microsoft.com -UserAgent ([Microsoft.PowerShell.Commands.PSUserAgent]::Chrome)

# Authenticating at a web server ^
# If the web server requires authentication, you have to use the -Credential parameter:

# Invoke-WebRequest -Uri https://www.contoso.com/ -OutFile C:"\path\file" -Credential "yourUserName"
# 1
# Invoke-WebRequest -Uri https://www.contoso.com/ -OutFile C:"\path\file" -Credential "yourUserName"
# Note that, if you omit the -Credential parameter, PowerShell will not prompt you for a user name and password and will throw this error:

# Invoke-WebRequest : Authorization Required

# You have to at least pass the user name with the -Credential parameter. PowerShell will then ask for the password. If you want to avoid a dialog window in your script, you can store the credentials in a PSCredential object:

# $Credentials = Get-Credential
# Invoke-WebRequest -Uri "https://www.contoso.com" -OutFile "C:\path\file" -Credential $Credentials
# 1
# 2
# $Credentials = Get-Credential
# Invoke-WebRequest -Uri "https://www.contoso.com" -OutFile "C:\path\file" -Credential $Credentials

# $url = "http://mirror.internode.on.net/pub/test/10meg.test"
# $output = "$PSScriptRoot\10meg.test"
# $start_time = Get-Date

# Invoke-WebRequest -Uri $url -OutFile $output
# Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"


# $url = "http://mirror.internode.on.net/pub/test/10meg.test"
# $output = "$PSScriptRoot\10meg.test"
# $start_time = Get-Date

# $wc = New-Object System.Net.WebClient
# $wc.DownloadFile($url, $output)
# #OR
# (New-Object System.Net.WebClient).DownloadFile($url, $output)

# Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

# $url = "http://mirror.internode.on.net/pub/test/10meg.test"
# $output = "$PSScriptRoot\10meg.test"
# $start_time = Get-Date

# Import-Module BitsTransfer
# Start-BitsTransfer -Source $url -Destination $output
# #OR
# Start-BitsTransfer -Source $url -Destination $output -Asynchronous

# Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"