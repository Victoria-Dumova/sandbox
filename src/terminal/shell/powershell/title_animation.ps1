[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Frames for the animation
$frames  = @('⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏')
$messages = @('Loading', 'Loading.', 'Loading..', 'Loading...')

$i = 0
while ($true) {
    $frame = $frames[$i % $frames.Length]
    $msg   = $messages[$i % $messages.Length]

    # Set terminal tab title via OSC escape sequence (works in PS 5.1+)
    [Console]::Write("$([char]27)]0;$frame $msg$([char]7)")

    # Print animation in the terminal body
    Write-Host -NoNewline "`r`e[36m$frame`e[0m $msg   "

    Start-Sleep -Milliseconds 100
    $i++
}