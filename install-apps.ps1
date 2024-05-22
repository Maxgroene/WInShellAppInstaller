
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
Write-Host "From Max Groeneweg" -ForegroundColor Blue

$installApps = Read-Host "Do you want to Install the Apps? (y/n)"

$customizeTerminal = Read-Host "Do you want to changing the colors of your terminal? (y/n)"

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
    Add-Content -Path $PROFILE -Value 'oh-my-posh --init --shell pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/jandedobbeleer.omp.json | Invoke-Expression'
    Write-Host "The colors of the Terminal changed succesfully."
} else {
    Write-Host "Changing colors of the Terminal was skipped."
}


