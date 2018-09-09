#!/bin/bash

isScreenOn=$(adb shell service call power 12 | cut -d' ' -f3)
if [[ $isScreenOn = *"00000000"* ]]; then
	echo "Android screen is OFF"
	#turn screen on
	echo "Turning screen on for screenshot"
	adb shell input keyevent KEYCODE_POWER
	echo "Screen should be on now"
else
	echo "Android screen is ON"
fi

sleep 2

echo "Doing screenshot"
#get screenshot
adb shell screencap -p | perl -pe 's/\x0D\x0A/\x0A/g' > screen.png
echo "Diddit"