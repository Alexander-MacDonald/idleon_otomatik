# Load Windows Forms assembly
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

Write-Host "Click anywhere and note the cursor position. Press Ctrl+C to exit."

try {
    while ($true) {
        # Get the current cursor position
        $position = [System.Windows.Forms.Cursor]::Position
        $bitmap = New-Object System.Drawing.Bitmap(1, 1)
        $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
        $graphics.CopyFromScreen($position.X, $position.Y, 0, 0, [System.Drawing.Size]::new(1,1))
        $color = $bitmap.GetPixel(0, 0)

        $graphics.Dispose()
        $bitmap.Dispose()
        Write-Host ("X = {0}, Y = {1}, R = {2}, G = {3}, B = {4}" -f $position.X, $position.Y, $color.R, $color.G, $color.B) -NoNewline
        Start-Sleep -Milliseconds 100
        Write-Host ("`r" * 10) -NoNewline  # Overwrite the previous position
    }
} catch {
    Write-Host "`nScript stopped."
}
