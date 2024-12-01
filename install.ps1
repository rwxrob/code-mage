# This script installs and configures the following:
#
# - Windows Terminal Preview (wt)
# - gruvbox-material theme
# - UbuntuMonoNerd font
# - Git Bash (bash, git, vim)
# - GitHub CLI (gh)
# - Neovim (nvim)
# - Golang (go)

# Example Usage:
# Download-File -Url $url ` -Destination $path"
function Download-File {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Url,

        [Parameter(Mandatory=$true)]
        [string]$Destination
    )

    # Get the directory from the destination path
    $destinationDir = Split-Path -Path $Destination -Parent

    # Ensure the directory exists
    if (-Not (Test-Path $destinationDir)) {
        Write-Host "Creating directory: $destinationDir"
        New-Item -ItemType Directory -Path $destinationDir -Force | Out-Null
    }

    # Download the file
    Write-Host "Downloading file from $Url to $Destination"
    Invoke-WebRequest -Uri $Url -OutFile $Destination -UseBasicParsing

    # Confirm completion
    Write-Host "File downloaded successfully to $Destination"
}

Write-Host "Installing Windows Terminal Preview using winget..."
winget install --id microsoft.windowsterminal.preview
$path = "C:\Program Files\WindowsApps\Microsoft.WindowsTerminalPreview_*"
if (-Not (Test-Path $path)) {
    Write-Error "Windows Terminal installation failed or not found at $path!"
    exit 1
}
Write-Host "Windows Terminal installed successfully."

& ([scriptblock]::Create((iwr 'https://to.loredo.me/Install-NerdFont.ps1'))) -Name ubuntu-mono" -Confirm:$false

# TODO Set gruvbox-material color theme
# TODO Set UbuntuMonoNerd font
# TODO Set bash as the default for all terminals

Write-Host "Installing Git Bash using winget..."
winget install --id git.git
$path = "C:\Program Files\Git\bin\bash.exe"
if (-Not (Test-Path $path)) {
    Write-Error "Git Bash installation failed or not found at $path!"
    exit 1
}
Write-Host "Git Bash installed successfully."

Write-Host "Installing using winget..."
winget install --id github.cli
$path="C:\Program Files\GitHub CLI\gh.exe"
if (-Not (Test-Path $path)) {
    Write-Error "GitHub CLI (gh) installation failed or not found at $path!"
    exit 1
}
Write-Host "GitHub CLI (gh) installed successfully."

Write-Host "Installing Neovim (nvim) using winget..."
winget install --id neovim.neovim
$path = "C:\Program Files\Neovim\bin\nvim.exe"
if (-Not (Test-Path $path)) {
    Write-Error "Neovim (nvim) installation failed or not found at $path!"
    exit 1
}
Write-Host "Neovim (nvim) installed successfully."

url= "https://raw.githubusercontent.com/rwxrob/code-mage/HEAD/files/etc/skel/.vimrc"
Download-File -Url $url -Destination $HOME/.vimrc

url= "https://raw.githubusercontent.com/rwxrob/code-mage/HEAD/files/etc/skel/.config/nvim/init.lua"
Download-File -Url $url -Destination $HOME/.config/nvim/init.lua

url= "https://raw.githubusercontent.com/rwxrob/code-mage/HEAD/files/etc/skel/.config/nvim/init.lua"
Download-File -Url $url -Destination $HOME/.config/nvim/init.lua

url= "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
Download-File -Url $url -Destination $HOME/.ssh/autoload/plug.vim

Write-Host "Installing Neovim (nvim) plugins..."
nvim +PlugInstall +qa
# TODO validate plugin install
Write-Host "Neovim (nvim) plugins installed successfully."

Write-Host "Installing Neovim Golang plugins (takes a while) ..."
nvim +GoInstallBinaries +qa
# TODO validate plugin install
Write-Host "Neovim Golang plugins installed successfully."

Write-Host "Installing Golang (go) using winget..."
winget install --id golang.go
$path = "C:\Go\bin\go.exe"
if (-Not (Test-Path $path)) {
    Write-Error "Golang (go) installation failed or not found at $path!"
    exit 1
}
Write-Host "Golang (go) installed successfully."

Write-Host "Installing Code-Mage (cm) using go..."
$path install "github.com/rwxrob/code-mage/cmd/cm@latest"
# TODO validate cm install
Write-Host "Code-Mage (cm) installed successfully."
