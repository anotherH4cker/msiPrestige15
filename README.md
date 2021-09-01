# msiPrestige15 

-Run this commands
```
cd msiPrestige15
sudo cp -r fancontrol /opt/
sudo cp fancontrol.service /etc/systemd/system/fancontrol.service
```

-Reload services
```
sudo systemctl daemon-reload
```
-Enable the service
```
sudo systemctl enable fancontrol.service
```
-Start the service
```
sudo systemctl start fancontrol.service
```
-Check the status of your service
```
systemctl status fancontrol.service
```


Bibliography: 
  https://timleland.com/how-to-run-a-linux-program-on-startup/
