# Define ANSI escape character
$esc = [char]27

# Print a static main line
Write-Host "Main operation status (press Ctrl+C to stop):"

# Loop to show/hide a second line every second
while ($true) {
    # Step 1: Show the second line (inlay)
    $inlay = "      Temporary status: pupupu......................................................."
    Write-Host $inlay
    Start-Sleep -Seconds 1

    # Step 2: Clear the inlay (move up and erase line)
    $clear = $esc + "[1A" + $esc + "[2K"
    Write-Host $clear -NoNewline
    Start-Sleep -Seconds 1
}
