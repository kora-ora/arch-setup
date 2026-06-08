#!/bin/bash

MODE=$(gum choose "Study Mode 🎓(50%)" "Performance Mode 🚀(100%)" "Status 📊")
if [ "$MODE" = "Study Mode 🎓(50%)" ]; then
  echo "switching to study mode..."
  echo "2250000" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq > /dev/null
  echo "$MODE" > ./.cpu-mode
elif [ "$MODE" = "Performance Mode 🚀(100%)" ]; then
  echo "switching to performance Mode..."
  echo "4500000" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq > /dev/null
  echo "$MODE" > ./.cpu-mode
else
  echo "Here the status:)"
  cat ./.cpu-mode
fi

