#!/bin/bash
while true; do
    vcgencmd measure_temp | grep -o -P "temp=\K([^']*)" | mosquitto_pub --stdin-line --topic sensors/cpu_temp;
    vcgencmd measure_clock arm | grep -o -P "frequency\(48\)=\K([^']*)" | mosquitto_pub --stdin-line --topic sensors/cpu_clock;
    grep wlan0 /proc/net/wireless | awk '{print $4 }' | grep -oP "(-|)\d+" | mosquitto_pub --stdin-line --topic sensors/wifi_strength;
    sleep 30;
done
