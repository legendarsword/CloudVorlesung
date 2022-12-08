echo "Es wird Last erzeugt für das Deployment Firstapp"
echo "Das Script zu schließen, erst 'screen -r load' eingeben und dann mit Strg+C beenden"
echo "Möchte man in den Pod-Aufgabe reinschauen, 'screen -r load' eingeben und mit der Folge 'Strg+a z' wieder verlassen"
echo "Mit folgendem Befehl kann die Replikaentstehung beobachtet werden: 'kubectl get hpa firstapp-hpa -n firstapp --watch'"
screen -AmdS load kubectl run -i --tty load-generator --rm -n firstapp --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://firstapp-service; done" nogui