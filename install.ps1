winget install --id git.git

$url = "https://raw.githubusercontent.com/rwxrob/code-mage/HEAD/install"

$script = Invoke-WebRequest -Uri $url -UseBasicParsing | Select-Object -ExpandProperty Content

& "C:\Program Files\Git\bin\bash.exe" -c "$script"
