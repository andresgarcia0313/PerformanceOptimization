## Process Priority Adjuster

This script is designed to adjust the process priority of certain system components to enhance performance. Specifically, it targets the processes related to the GNOME System Monitor, Plasma Shell, and KWin.

### How it Works

1. **Check for Password File**: Verifies the existence of the `pass` file which contains the user's sudo password.
   
2. **Read Sudo Password**: Reads the sudo password from the `pass` file.
   
3. **Authenticate with Sudo**: Uses the sudo password to authenticate and extend the sudo timeout.
   
4. **Find GNOME System Monitor Process ID**: Locates the process ID (PID) of the `gnome-system-monitor`.
   
5. **Get Plasma Shell and KWin Process IDs**: Retrieves the PIDs of `plasmashell` and `kwin_x11`.
   
6. **Print Process IDs**: Displays the PID of the `gnome-system-monitor`, `plasmashell`, and `kwin_x11` processes if found.
   
7. **Adjust Process Priority**: If all processes are found, it adjusts the priority of `plasmashell` and `kwin_x11` to -17 using `renice`.

### How to Use

0. Clone this repository
git clone https://github.com/andresgarcia/performanceOptimization
1. Ensure the `pass` file containing the sudo password exists in the same directory as the script.
3. Set execute permissions to the file
chmod +x process_priority_adjuster.sh
3. Run the script using:
   ```bash
   ./process_priority_adjuster.sh
   ```

### Requirements

- Linux environment with kde
- `pass` file containing sudo password

### Notes

- Make sure to run this script with appropriate permissions.
  
- This script can enhance system responsiveness by adjusting the process priority.

🚀😊🎉