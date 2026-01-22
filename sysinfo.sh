#!/bin/bash

echo "========== SYSTEM INFORMATION =========="
echo "Date & Time: $(date)"
echo "Username: $(whoami)"
echo "Current Directory: $(pwd)"
echo "Home Directory: $HOME"

file_count=$(ls -1 | wc -l)
echo "Number of files in current directory: $file_count"

echo
echo "========== NETWORK INFORMATION =========="
echo "Hostname: $(hostname)"

echo
echo "DNS lookup for google.com:"
google_ip=$(nslookup google.com 2>/dev/null | grep "Address:" | tail -n 1 | awk '{ print $2 }')

if [ -z "$google_ip" ]; then
  echo "Failed to resolve google.com"
else
  echo "google.com IP Address: $google_ip"
fi

echo
echo "Checking network connectivity (ping google.com)..."
if ping -n 1 google.com > /dev/null 2>&1; then
  echo "Network status: Connected ✅"
else
  echo "Network status: Not connected ❌"
fi

echo "========================================"
