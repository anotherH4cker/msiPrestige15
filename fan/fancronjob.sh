#!/bin/bash

if [ ! -f "/tmp/mode.txt" ]; then echo "3" > /tmp/mode.txt; fi

MODE=$(head -1 /tmp/mode.txt)
#0=quiet, 1=normal, 2=loud
QUIET_MODE_MAX=45
NORMAL_MODE_MIN=47
NORMAL_MODE_MAX=67
LOUD_MODE_MIN=70


OUTPUT=$(sensors | grep "Package id 0:" | cut -d " " -f 5 | cut -d "+" -f 2 | cut -d "." -f 1)
#OUTPUT=${OUTPUT%"°C"}

counter=1
while [ $counter -le 10 ]
do
	if [ $OUTPUT -le $QUIET_MODE_MAX ] && [ $MODE -ne 0 ]
	then
		echo "T<40 and Mode=Not silent"
		sudo python3 /opt/fancontrol/fan/control.py /opt/fancontrol/fan/quiet.ini &
		MODE=0
		echo "0" > /tmp/mode.txt
		echo "*********************** Quiet mode activated"
	fi

	if [ $OUTPUT -ge $NORMAL_MODE_MIN ] && [ $OUTPUT -le $NORMAL_MODE_MAX ] && [ $MODE -ne 1 ]
	then
		echo "T>41 & T<69 and Mode=Not normal"
		sudo python3 /opt/fancontrol/fan/control.py /opt/fancontrol/fan/normal.ini &
		MODE=1
		echo "1" > /tmp/mode.txt
		echo "*********************** Normal mode activated"
	fi

	if [ $OUTPUT -ge $LOUD_MODE_MIN ] && [ $MODE -ne 2 ]
	then
		echo "T>70 and Mode=Not loud"
		sudo python3 /opt/fancontrol/fan/control.py /opt/fancontrol/fan/loud.ini &
		MODE=2
		echo "2" > /tmp/mode.txt
		echo "*********************** Loud mode activated"
	fi
	sleep 1
done


