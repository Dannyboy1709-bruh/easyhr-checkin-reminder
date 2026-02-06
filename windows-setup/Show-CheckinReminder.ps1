# EasyHR Check-in Reminder Script
# This script shows a Windows notification with a clickable link

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the form
$form = New-Object System.Windows.Forms.Form
$form.Text = '🔔 EasyHR Check-in Reminder'
$form.Size = New-Object System.Drawing.Size(450, 250)
$form.StartPosition = 'CenterScreen'
$form.TopMost = $true
$form.BackColor = [System.Drawing.Color]::White

# Add icon/emoji label
$labelIcon = New-Object System.Windows.Forms.Label
$labelIcon.Location = New-Object System.Drawing.Point(180, 20)
$labelIcon.Size = New-Object System.Drawing.Size(100, 40)
$labelIcon.Text = '🔔'
$labelIcon.Font = New-Object System.Drawing.Font('Segoe UI', 24)
$labelIcon.TextAlign = 'MiddleCenter'
$form.Controls.Add($labelIcon)

# Add title label
$labelTitle = New-Object System.Windows.Forms.Label
$labelTitle.Location = New-Object System.Drawing.Point(20, 70)
$labelTitle.Size = New-Object System.Drawing.Size(400, 30)
$labelTitle.Text = 'Time for your EasyHR check-in!'
$labelTitle.Font = New-Object System.Drawing.Font('Segoe UI', 14, [System.Drawing.FontStyle]::Bold)
$labelTitle.TextAlign = 'MiddleCenter'
$form.Controls.Add($labelTitle)

# Add instruction label
$labelInfo = New-Object System.Windows.Forms.Label
$labelInfo.Location = New-Object System.Drawing.Point(20, 110)
$labelInfo.Size = New-Object System.Drawing.Size(400, 20)
$labelInfo.Text = 'Click the button below to start your check-in'
$labelInfo.Font = New-Object System.Drawing.Font('Segoe UI', 10)
$labelInfo.TextAlign = 'MiddleCenter'
$form.Controls.Add($labelInfo)

# Add the button
$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(125, 150)
$button.Size = New-Object System.Drawing.Size(200, 40)
$button.Text = 'Do My Check-in'
$button.Font = New-Object System.Drawing.Font('Segoe UI', 12, [System.Drawing.FontStyle]::Bold)
$button.BackColor = [System.Drawing.Color]::FromArgb(34, 139, 34)
$button.ForeColor = [System.Drawing.Color]::White
$button.FlatStyle = 'Flat'
$button.Cursor = 'Hand'
$button.Add_Click({
    # Open Perplexity with pre-filled message
    Start-Process 'https://www.perplexity.ai'
    $form.Close()
})
$form.Controls.Add($button)

# Play a sound
[System.Media.SystemSounds]::Asterisk.Play()

# Show the form
$form.ShowDialog()
