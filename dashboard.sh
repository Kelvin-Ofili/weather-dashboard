#!/bin/bash

while true; do
  clear
  echo "========== CLI DASHBOARD =========="
  echo "1. Check Weather"
  echo "2. View System Info"
  echo "3. View Network Info"
  echo "4. Exit"
  echo "=================================="
  read -p "Select an option (1-4): " choice

  case "$choice" in
    1)
      clear
      echo "----- Weather Dashboard -----"
      bash weather.sh
      ;;
    2)
      clear
      echo "----- System Information -----"
      bash sysinfo.sh
      ;;
    3)
      clear
      echo "----- Network Information -----"
      bash sysinfo.sh | sed -n '/NETWORK INFORMATION/,$p'
      ;;
    4)
      echo "Goodbye!"
      exit 0
      ;;
    *)
      echo "Invalid option. Please enter a number between 1 and 4."
      ;;
  esac

  echo
  read -p "Press Enter to continue..."
done
