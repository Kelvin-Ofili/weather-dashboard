#!/bin/bash

echo "=== Weather Dashboard ==="

count=0

while [ $count -lt 3 ]; do
  echo
  read -p "Enter city name: " city

  if [ -z "$city" ]; then
    echo "City name cannot be empty."
    continue
  fi

  response=$(curl -s "https://wttr.in/$city?format=j1")

  if [ -z "$response" ]; then
    echo "Failed to fetch weather data."
    continue
  fi

  # Extract values safely
  temp=$(echo "$response" | grep -m1 '"temp_C"' | sed 's/[^0-9.-]*//g')
  humidity=$(echo "$response" | grep -m1 '"humidity"' | sed 's/[^0-9]*//g')
  wind=$(echo "$response" | grep -m1 '"windspeedKmph"' | sed 's/[^0-9]*//g')

  condition=$(echo "$response" \
    | grep -A 2 '"weatherDesc"' \
    | grep '"value"' \
    | head -n 1 \
    | sed 's/.*"value":[[:space:]]*"\([^"]*\)".*/\1/')
  if [ -z "$temp" ] || [ -z "$condition" ]; then
    echo "Invalid city name or no weather data found."
    continue
  fi

  echo
  echo "📍 City: $city"
  echo "🌡 Temperature: ${temp}°C"
  echo "🌤 Condition: $condition"
  echo "💧 Humidity: ${humidity}%"
  echo "🌬 Wind Speed: ${wind} km/h"

  ((count++))

  if [ $count -lt 3 ]; then
    read -p "Check another city? (y/n): " choice
    choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

    if [ "$choice" != "y" ]; then
      break
    fi
  fi
done

echo "Exiting weather dashboard."
