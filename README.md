# `desktop-bg`
This script randomly sets your desktop background from a folder of images since there is no feature to do this built into Ubuntu.
## Instructions
1. Clone this repository
```
git clone https://github.com/OliLeiriao/desktop-bg/
```
2. Modify the first line to point to where your folder of background images is.
```bash
# 1. Define the folder path.
# $HOME is a shortcut for /home/yourusername (~/)
DIR="$HOME/Pictures/background"
```
3. make the script executable
```
chmod +x ~/desktop-bg.sh
```
4. Schedule a routine execution of this script with `cron`. If this is your first time scheduling something on this device, it'll ask you to pick a text editor. Pick `nano`.
```
crontab -e
```
5. Add this line to the very end of your schedule.
CRUCIAL STEP: change `YOUR_USERNAME` with your actual user name.
```
*/30 * * * * /bin/bash /home/YOUR_USERNAME/rotate_bg.sh
```
This sets it to change every 30 minutes, but you can play with the frequency by modifying the beginning of this line:
`*/30`: Runs at the 0 and 30 minute marks of every hour.
`* * * *`: Runs for every hour, day, month, and day of the week.

Save and exit the crontab file (Ctrl+X, then Y, then Enter). 
You should see a message confirming: `crontab: installing new crontab`

And there you go!

## Troubleshooting
**My background never changed :(**

Since `cron` runs jobs without the full graphical environment, the script might fail to change the background if it can't find your session. 
If the background does not change after 30 minutes, you can try modifying the cron entry with your display information:
```
*/30 * * * * env DISPLAY=:0 /bin/bash /home/YOUR_USERNAME/rotate_bg.sh
```