echo "Es wird Last erzeugt für das Deployment Firstapp"
echo "Das Script zu schließen, erst 'screen -r load' eingeben und dann mit Strg+C beenden und mit 'exit' verlassen"
screen -AmdS load kubectl run -i --tty load-generator --rm -n firstapp --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://firstapp-service; done" nogui