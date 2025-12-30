#!/usr/bin/env bash

# Launch Thunar (new window if already running)
thunar &
sleep 1
thunar --quit &
