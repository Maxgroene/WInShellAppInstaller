# WInShellAppInstaller

This repository contains a set of scripts to facilitate the installation of applications on Windows systems. 

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