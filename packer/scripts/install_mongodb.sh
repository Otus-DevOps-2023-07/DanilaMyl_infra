#!/bin/bash
apt update
sleep 8
apt install mongodb -y
sleep 8
systemctl start mongodb
sleep 8
systemctl enable mongodb
sleep 8
