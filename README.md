# WInShellAppInstaller
<img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/PowerShell_5.0_icon.png"
     alt="Markdown Monster icon"
     style="float: left; margin-right: 10px;" />
     
This Windows Powershell scrypt simplifies the installation of the most important apps for my private school use as well as the graphical customisation of the terminal and the installation of the most important drivers for communication with µControllers  

## Usage

1. **Allow Script Execution:**
   
   Before running the installation script, ensure that PowerShell script execution is allowed. You can do this by executing the following command:

   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

2. **Run Scrypt:**
    ```powershell
    .\install-apps.ps1

3. **Deny Script Execution:**
   
   after running the installation script, ensure that PowerShell script execution is denyded. You can do this by executing the following command:

   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope CurrentUser