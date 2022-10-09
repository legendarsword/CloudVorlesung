# CloudVorlesung

Willkommen bei Mischmarsch aus IoT/Cloud und eigenem Blödsinn

Im "Docker-install.sh" Skript sind benötigten Befehle für Docker und Docker-Compose-Installation zu finden

# Befehlssammlung
<p>Imagen Bauen ("." ist der Ordner):</p>

docker build -t app . 


<p>Container erstellen (Name und Version vom Docker Hub nehmen):</p>

docker run --name "Container-Name" -it "Docker-Imagename"

(it = interactive Terminal)


<p>Docker-Compose starten (falls Datei "docker-compose.yaml" heißt):</p>

docker-compose up 


<p>Docker-Compose starten (falls Datei anders heißt):</p>

docker-compose up -f "Compose-Dateiname"


<p>Docker-Compose im Hintergrund starten (falls Datei "docker-compose.yaml" heißt):</p>

docker-compose up -d
