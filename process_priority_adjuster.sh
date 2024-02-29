#!/bin/bash
if [ ! -f "./pass" ]; then
  echo "The file pass does not exist. Please create it and add your sudo password."
  exit 1
fi
read -s SUDO_PASSWORD < ./pass
echo "$SUDO_PASSWORD" | sudo -v

GNOME_MONITOR_PID=$(pidof gnome-system-monitor)
PLASMA_PID=$(pidof plasmashell)
KWIN_PID=$(pidof kwin_x11)
if [ -n "$GNOME_MONITOR_PID" ]; then
  echo "ID gnome-system-monitor: $GNOME_MONITOR_PID 🎉🚀😊" 
else
  echo "Gnome Monitor is not running. 🤔" 
fi
echo "ID Plasma Shell: $PLASMA_PID 🎉"
echo "ID KWin: $KWIN_PID 🚀"
if [ -z "$PLASMA_PID" ] || [ -z "$KWIN_PID" ]; then
  echo "Plasma Shell or KWin is not running. Please start them and try again. 🤔"
  exit 1
fi
echo "$SUDO_PASSWORD" | sudo -S renice -n -20 -p $PLASMA_PID
echo "$SUDO_PASSWORD" | sudo -S renice -n -20 -p $KWIN_PID
echo "Set priority in Plasma Shell and KWin with -17."
