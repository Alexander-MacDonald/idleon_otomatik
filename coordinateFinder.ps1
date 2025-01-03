# Load Windows Forms assembly
Add-Type -AssemblyName System.Windows.Forms

Write-Host "Click anywhere and note the cursor position. Press Ctrl+C to exit."

try {
    while ($true) {
        # Get the current cursor position
        $position = [System.Windows.Forms.Cursor]::Position
        Write-Host ("X = {0}, Y = {1}" -f $position.X, $position.Y) -NoNewline
        Start-Sleep -Milliseconds 100
        Write-Host ("`r" * 10) -NoNewline  # Overwrite the previous position
    }
} catch {
    Write-Host "`nScript stopped."
}
