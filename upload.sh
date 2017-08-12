#!/bin/bash

NODEMCU_PORT=/dev/cu.SLAB_USBtoUART

nodemcu-tool upload -c -o -p $NODEMCU_PORT *.lua
nodemcu-tool remove -p $NODEMCU_PORT init.lc
nodemcu-tool upload -p $NODEMCU_PORT init.lua
