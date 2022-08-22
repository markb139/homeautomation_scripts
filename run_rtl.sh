#!/usr/bin/bash

rtl_433 -F "mqtt://127.0.0.1:1883,retain=0,events=sensors[/type][/model][/id]"

