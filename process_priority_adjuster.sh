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
  echo "ID gnome-system-monitor: $pid 🎉🚀😊" 
else
  echo "GNOME is not running. 🤔" 
fi
echo "ID Plasma Shell: $PLASMA_PID 🎉"
echo "IDKWin: $KWIN_PID 🚀"
if [ -z "$PLASMA_PID" ] || [ -z "$KWIN_PID" ]; then
  echo "Plasma Shell or KWin is not running. Please start them and try again. 🤔"
  exit 1
fi
echo "$SUDO_PASSWORD" | sudo -S renice -n -17 -p $PLASMA_PID
echo "$SUDO_PASSWORD" | sudo -S renice -n -17 -p $KWIN_PID
echo "Se ha ajustado la prioridad de Plasma Shell y KWin a -17."
