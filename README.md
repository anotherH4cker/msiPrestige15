# msiPrestige15

1. Put the fan folder in the "/opt/" directory 
https://timleland.com/how-to-run-a-linux-program-on-startup/



-Run this command

sudo nano /etc/systemd/system/YOUR_SERVICE_NAME.service

-Paste in the command below. Press ctrl + x then y to save and exit

Description=GIVE_YOUR_SERVICE_A_DESCRIPTION

Wants=network.target
After=syslog.target network-online.target

[Service]
Type=simple
ExecStart=YOUR_COMMAND_HERE
Restart=on-failure
RestartSec=10
KillMode=process

[Install]
WantedBy=multi-user.target

-Reload services

sudo systemctl daemon-reload

-Enable the service

sudo systemctl enable YOUR_SERVICE_NAME

-Start the service

sudo systemctl start YOUR_SERVICE_NAME

-Check the status of your service

systemctl status YOUR_SERVICE_NAME

