#!/usr/bin/bash

systemctl start home_automation.service
systemctl start broadlink_mqtt.service
systemctl start rtl_433.service
systemctl start pi_info.service
