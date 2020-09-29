# msiPrestige15

1. Put the fan folder in the "/opt/" directory 
2. Run "sudo crontab -e" 
3. Add at the end of the file "* * * * * while true; do /opt/fan/fancronjob.sh &  sleep 1; done" AND an empty line at the end.
