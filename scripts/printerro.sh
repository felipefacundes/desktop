#!/bin/bash

sudo systemctl stop cups-browsed
sleep 1
sudo systemctl disable cups-browsed
sleep 1
sudo cupsdisable
sleep 1
sudo systemctl start cups-browsed
sleep 1
sudo systemctl enable cups-browsed
sleep 1
sudo cupsenable
sleep 1
sudo systemctl status cups-browsed
sleep 1
exit
