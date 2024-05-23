# WInShellAppInstaller
<img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/PowerShell_5.0_icon.png"
     alt="Powershellicon"
     style="float: left; margin-right: 10px;" />
     
This Windows Powershell scrypt simplifies the installation of the most important apps for my private school use as well as the graphical customisation of the terminal and the installation of the most important drivers for communication with µControllers  

## Usage

1. **Allow Script Execution:**
   
   Before running the installation script, ensure that PowerShell script execution is allowed. You can do this by executing the following command:

   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

2. **Run Scrypt:**
   
   To Start the Scrypt move to the Filepath an open it with the Terminal.
   Then Rum follwing command:
    ```powershell
    .\install-apps.ps1
<img src="https://raw.githubusercontent.com/Maxgroene/WInShellAppInstaller/main/Images/installerpreview.png"
     alt="AppInstallerPreview"
     style="float: left; margin-right: 10px;" />
     here you can choose what do you want to install

3. **Deny Script Execution:**
   
   after running the installation script, ensure that PowerShell script execution is denyed. You can do this by executing the following command:

   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope CurrentUser