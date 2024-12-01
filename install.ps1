# Install Git Bash using winget
Write-Host "Installing Git Bash using winget..."
winget install --id git.git

# Verify Git Bash installation
$gitBashPath = "C:\Program Files\Git\bin\bash.exe"
if (-Not (Test-Path $gitBashPath)) {
    Write-Error "Git Bash installation failed or not found at $gitBashPath!"
    exit 1
}
Write-Host "Git Bash installed successfully."

# Fetch the Bash script from the internet
$url = "https://raw.githubusercontent.com/rwxrob/code-mage/HEAD/install"
Write-Host "Fetching Bash script from $url..."
$script = Invoke-WebRequest -Uri $url -UseBasicParsing | Select-Object -ExpandProperty Content

# Save the fetched script to the Git Bash default home directory with name 'install'
$gitBashHome = "$HOME/install"  # This resolves to the Git Bash home directory
Set-Content -Path $gitBashHome -Value $script
Write-Host "Bash script saved to $gitBashHome."

# Inform the user to manually run the script
Write-Host ""
Write-Host "================================================================="
Write-Host "The Bash script has been saved to your Git Bash home directory:"
Write-Host "  $gitBashHome"
Write-Host ""
Write-Host "To execute it:"
Write-Host "1. Open a Git Bash terminal."
Write-Host "2. Run the following command:"
Write-Host "   ./install"
Write-Host "================================================================="
Write-Host ""
