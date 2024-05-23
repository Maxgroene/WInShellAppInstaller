
$apps = @(
    "Microsoft.VisualStudioCode",
    "Mozilla.Firefox",
    "7zip.7zip",
    "Spotify.Spotify",
    "Balena.Etcher",
    "Bambulab.Bambustudio",
    "Bitwarden.Bitwarden",
    "Microsoft.VisualStudio.2022.Community",
    "Discord.Discord",
    "Git.Git",
    "Oracle.VirtualBox",
    "DuckDuckGo.DesktopBrowser",
    "emqx.mqttx",
    "Nextcloud.NextcloudDesktop",
    "OpenVPNTechnologies.OpenVPNConnect",
    "Prusa3D.PrusaSlicer",
    "Valve.Steam",
    "WinSCP.WinSCP",
    "angryziber.AngryIPScanner",
    "Tutanota.Tutanota",
    "ApacheFriends.Xampp.8.2",
    "valinet.ExplorerPatcher",
    "9WZDNCRD29V9"
)
Write-Host "
                           _____           _        _ _           
     /\                   |_   _|         | |      | | |          
    /  \   _ __  _ __ ______| |  _ __  ___| |_ __ _| | | ___ _ __ 
   / /\ \ | '_ \| '_ \______| | | '_ \/ __| __/ _` | | |/ _ \ '__|
  / ____ \| |_) | |_) |    _| |_| | | \__ \ || (_| | | |  __/ |   
 /_/    \_\ .__/| .__/    |_____|_| |_|___/\__\__,_|_|_|\___|_|   
          | |   | |                                               
          |_|   |_|                                               
" -ForegroundColor Green
Write-Host "From Max Groeneweg" -ForegroundColor Blue

$installApps = Read-Host "Do you want to Install the Apps? (y/n)"

$customizeTerminal = Read-Host "Do you want to changing the colors of your terminal? (y/n)"

$WindowsDarkMode = Read-Host "Do you want to enable the windows Dark Mode? (y/n)"

$InstallCP210xDriver = Read-Host "Do you want to Install the CP210x Driver? (y/n)"

if ($installApps -eq "y") {
    foreach ($app in $apps) {
        Write-Host "Installing $app..."
        winget install --id $app --silent --accept-package-agreements --accept-source-agreements
        if ($LASTEXITCODE -eq 0) {
            Write-Host "$app Installed successfully."
        } else {
            Write-Host "error installing $app."
        }
    }
} else {
    Write-Host "App Installation skipped."
}

if ($customizeTerminal -eq "y") {
    Write-Host "Changing the colors of the terminal..."
    winget install JanDeDobbeleer.OhMyPosh --silent --accept-package-agreements --accept-source-agreements
    New-Item -Type File -Force $profile
    Add-Content -Path $PROFILE -Value 'oh-my-posh --init --shell pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/powerline.omp.json | Invoke-Expression'
    Write-Host "The colors of the Terminal changed succesfully."
} else {
    Write-Host "Changing colors of the Terminal was skipped."
}

if ($WindowsDarkMode -eq "y") {
    $personalizePath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
    $appsUseLightTheme = "AppsUseLightTheme"
    $systemUsesLightTheme = "SystemUsesLightTheme"

    # Set both themes (Apps and System) to dark mode
    Set-ItemProperty -Path $personalizePath -Name $appsUseLightTheme -Value 0
    Set-ItemProperty -Path $personalizePath -Name $systemUsesLightTheme -Value 0
    
    Write-Host "Windows DarkMode enabled."
} else {
    Write-Host "Changing To Windows DarkMode was skipped."
}

if ($InstallCP210xDriver -eq "y") {
# Definiere die URLs und Pfade
$downloadUrl = "https://www.silabs.com/documents/public/software/CP210x_Universal_Windows_Driver.zip"
$zipFilePath = "$env:TEMP\CP210x_Universal_Windows_Driver.zip"
$extractPath = "$env:TEMP\CP210x_Universal_Windows_Driver"

# Herunterladen der ZIP-Datei
Invoke-WebRequest -Uri $downloadUrl -OutFile $zipFilePath

# Erstellen des Verzeichnisses für die entpackten Dateien
if (!(Test-Path -Path $extractPath)) {
    New-Item -ItemType Directory -Path $extractPath | Out-Null
}

# Entpacken der ZIP-Datei
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipFilePath, $extractPath)

# Installieren des Treibers
$infPath = Get-ChildItem -Path $extractPath -Filter "*.inf" -Recurse | Select-Object -First 1
pnputil.exe /add-driver $infPath.FullName /install

# Bereinigen der temporären Dateien
Remove-Item -Path $zipFilePath -Force
Remove-Item -Path $extractPath -Recurse -Force

Write-Host "Treiberinstallation abgeschlossen."
}


