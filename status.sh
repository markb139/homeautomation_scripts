#!/usr/bin/bash

systemctl is-active --quiet home_automation.service && echo "homeautomation running" || echo "!!! homeautomation is not running !!!"
systemctl is-active --quiet broadlink_mqtt.service && echo "broadlink running" || echo "!!! broadlink not running !!!"
systemctl is-active --quiet rtl_433.service && echo "RTL 433 running" || echo "!!! RTL 433 not running !!!"
systemctl is-active --quiet pi_info.service && echo "Pi Info running" || echo "!!! Pi Info not running !!!"
systemctl is-active --quiet mosquitto.service && echo "Mosquitto running" || echo "!!! Mosquitto not running !!!"
