# Windows Setup Guide for EasyHR Check-in Reminder

This guide will help you set up an automated daily reminder on Windows that shows a popup at 10:30 AM with a button to start your EasyHR check-in.

## Quick Setup (Copy & Paste Method)

### Step 1: Download the Script

1. Click on `Show-CheckinReminder.ps1` in this folder
2. Click "Raw" button
3. Right-click → "Save As" and save it to your `Documents` folder

### Step 2: Create the Scheduled Task

1. Press `Windows Key + R`
2. Type: `taskschd.msc` and press Enter
3. Click "Create Task" in the right panel
4. In the "General" tab:
   - Name: `EasyHR Check-in Reminder`
   - Description: `Daily reminder for EasyHR check-in at 10:30 AM`
   - Check "Run whether user is logged on or not"
   - Check "Run with highest privileges"

5. In the "Triggers" tab:
   - Click "New"
   - Begin the task: "On a schedule"
   - Settings: "Daily", Start time: `10:30 AM`
   - Check "Repeat task every: " (leave unchecked)
   - Advanced Settings → Check "Enabled"
   - Click "OK"

6. In the "Actions" tab:
   - Click "New"
   - Action: "Start a program"
   - Program/script: `powershell.exe`
   - Add arguments: `-WindowStyle Hidden -ExecutionPolicy Bypass -File "C:\Users\YourUsername\Documents\Show-CheckinReminder.ps1"`
   - **Important**: Replace `YourUsername` with your actual Windows username
   - Click "OK"

7. In the "Conditions" tab:
   - Uncheck "Start the task only if the computer is on AC power"

8. In the "Settings" tab:
   - Check "Allow task to be run on demand"
   - Check "Run task as soon as possible after a scheduled start is missed"
   - Click "OK"

### Step 3: Test It!

1. Right-click on your new task in Task Scheduler
2. Click "Run"
3. You should see a popup window with a green "Do My Check-in" button
4. Click the button to test - it will open Perplexity

## How It Works

- Every weekday at **10:30 AM IST**, Windows will automatically show a popup window
- The popup has a big green button: **"Do My Check-in"**
- When you click the button:
  - It opens https://www.perplexity.ai in your browser
  - You simply say: "Do my EasyHR check-in"
  - Comet will handle the entire login and check-in process

## Troubleshooting

### Script doesn't run?
1. Check that the script path in Task Scheduler is correct
2. Make sure you replaced `YourUsername` with your actual username
3. Right-click the script file → Properties → Check "Unblock" if present

### Can't see the popup?
1. Make sure "Run whether user is logged on or not" is checked
2. Try running the script manually:
   - Right-click `Show-CheckinReminder.ps1` → "Run with PowerShell"

### Want to change the time?
1. Open Task Scheduler
2. Find your task → Right-click → Properties
3. Go to "Triggers" tab → Edit the trigger → Change the time

## Manual Testing

To test the script anytime:
1. Open PowerShell
2. Navigate to the script location: `cd ~\Documents`
3. Run: `.\Show-CheckinReminder.ps1`

---

**Your automated EasyHR check-in reminder is now set up!** 🎉
