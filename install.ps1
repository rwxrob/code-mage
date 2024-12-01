# Install Git Bash using winget
Write-Host "Installing Git Bash using winget..."
winget install --id git.git -e --source winget

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

# Save the fetched script to a temporary file
$tempScriptPath = "$env:TEMP\install.sh"
Set-Content -Path $tempScriptPath -Value $script
Write-Host "Bash script saved to $tempScriptPath."

# Run the Bash script using Git Bash and display output in real-time
Write-Host "Running the Bash script..."
& $gitBashPath -c "`"$tempScriptPath`""

# Clean up the temporary file
#Remove-Item -Path $tempScriptPath -Force
#Write-Host "Temporary script file removed."
