
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
    "9WZDNCRD29V9"
)
Write-Host "

           _____  _____      _____     _        _ _           
     /\   |  __ \|  __ \    |_   _|   | |      | | |          
    /  \  | |__) | |__) |_____| |  ___| |_ __ _| | | ___ _ __ 
   / /\ \ |  ___/|  ___/______| | / __| __/ _` | | |/ _ \ '__|
  / ____ \| |    | |         _| |_\__ \ || (_| | | |  __/ |   
 /_/    \_\_|    |_|        |_____|___/\__\__,_|_|_|\___|_|   
                                                              
                                                              

" -ForegroundColor Green
Write-Host "From Max Groeneweg" -ForegroundColor Red

$installApps = Read-Host "Moechten Sie die Apps installieren? (ja/nein)"

$customizeTerminal = Read-Host "Moechten Sie das Terminal grafisch anpassen? (ja/nein)"

if ($installApps -eq "ja") {
    foreach ($app in $apps) {
        Write-Host "Installiere $app..."
        winget install --id $app --silent --accept-package-agreements --accept-source-agreements
        if ($LASTEXITCODE -eq 0) {
            Write-Host "$app wurde erfolgreich installiert."
        } else {
            Write-Host "Fehler bei der Installation von $app."
        }
    }
} else {
    Write-Host "App-Installation Uebersprungen."
}

if ($customizeTerminal -eq "ja") {
    Write-Host "Passe das Terminal grafisch an..."
    Write-Host "Terminal wurde angepasst."
} else {
    Write-Host "Grafische Anpassung des Terminals Uebersprungen."
}

