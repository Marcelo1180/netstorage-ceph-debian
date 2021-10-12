#!/bin/sh
CONFIG_LOCATION="/tmp/vagrant-ssh-config-$(date +%s)"
vagrant ssh-config > $CONFIG_LOCATION
cssh -o "-F $CONFIG_LOCATION" $@
