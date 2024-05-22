# Liste der zu installierenden Anwendungen
$apps = @(
    "Microsoft.VisualStudioCode",
    "Mozilla.Firefox",
    "7zip.7zip",
    "Spotify.Spotify",
    "Balena.Etcher",
    "Bambulab.Bambustudio",
    "Bitwarden.Bitwarden",+
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
    "9WZDNCRD29V9" // Microsoft Store App ID for Office 365
)

foreach ($app in $apps) {
    Write-Host "Installiere $app..."
    winget install --id $app --silent --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -eq 0) {
        Write-Host "$app wurde erfolgreich installiert."
    } else {
        Write-Host "Fehler bei der Installation von $app."
    }
}
