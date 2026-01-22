# Make sure background is clean and predictable
$Host.UI.RawUI.BackgroundColor = 'Black'
Clear-Host

$colors = @(
    'Black','DarkBlue','DarkGreen','DarkCyan',
    'DarkRed','DarkMagenta','DarkYellow','Gray',
    'DarkGray','Blue','Green','Cyan',
    'Red','Magenta','Yellow','White'
)

Write-Host "=== PowerShell color palette test ===`n"

foreach ($c in $colors) {
    $text = "Foreground: {0}" -f $c
    # Pad text so all lines have the same length
    $padded = $text.PadRight(30)
    Write-Host $padded -ForegroundColor $c
}

Write-Host ""
Write-Host "THIS LINE SHOULD BE PURE WHITE"   -ForegroundColor White
Write-Host "THIS LINE SHOULD BE PURE MAGENTA" -ForegroundColor Magenta
Write-Host "THIS LINE SHOULD BE PURE CYAN"    -ForegroundColor Cyan
