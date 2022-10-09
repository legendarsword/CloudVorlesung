# CloudVorlesung

Willkommen bei Mischmarsch aus IoT/Cloud und eigenem Blödsinn

Im "Docker-install.sh" Skript sind benötigten Befehle für Docker und Docker-Compose-Installation zu finden

# Befehlssammlung
Imagen Bauen ("." ist der Ordner):
docker build -t app . 

Container erstellen (Name und Version vom Docker Hub nehmen):
docker run --name "Container-Name" -it "Docker-Imagename"
(it = interactive Terminal)

Docker-Compose starten (falls Datei "docker-compose.yaml" heißt):
docker-compose up 

Docker-Compose starten (falls Datei anders heißt):
docker-compose up -f "Compose-Dateiname"

Docker-Compose im Hintergrund starten (falls Datei "docker-compose.yaml" heißt):
docker-compose up -d