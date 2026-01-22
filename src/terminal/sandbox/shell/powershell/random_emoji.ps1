# Define a list of emojis
$emojis = @(
  "😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "😊", "😇",
  "😍", "🤩", "😘", "😜", "😎", "🤓", "😏", "😬", "🙃", "😺",
  "👍", "👏", "💪", "🙏", "🤝", "🔥", "💥", "🌈", "⭐", "⚡",
  "🌍", "🚀", "🎉", "🎈", "🍕", "🍩", "🍔", "🍎", "🧠", "🎮"
)

# How many random emojis to print
$count = 100

# Generate and print them
for ($i = 0; $i -lt $count; $i++) {
  $index = Get-Random -Minimum 0 -Maximum $emojis.Count
  Write-Host $emojis[$index]
  sleep 1
}

Write-Host "`nDone!"
