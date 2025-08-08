# Simple spinner loop in PowerShell
$spin = @('-', '\', '|', '/')
while ($true) {
    foreach ($char in $spin) {
        Write-Host -NoNewline "`r$char"
        Start-Sleep -Milliseconds 100
    }
}
