# https://itc-life.ru/deploy-k3skubernetes-ha-cluster-with-3-master-nodes/

apt update && apt upgrade -y

# Server(init) install
export K3S_KUBECONFIG_MODE="644"
export INSTALL_K3S_CHANNEL="v1.24"
curl -sfL https://get.k3s.io |  sh -

# Server-Schlüssel herausfinden (optional)
# cat /var/lib/rancher/k3s/server/node-token

# Helm-3 installieren
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Vorbereitung für Rancher (Cert-Manager installieren)
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.5.1/cert-manager.crds.yaml
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.5.1

# Rancher installieren:

helm repo add rancher-stable https://releases.rancher.com/server-charts/latest
kubectl create namespace cattle-system

kubectl get pods --namespace cert-manager
helm install rancher rancher-stable/rancher --namespace cattle-system --set hostname=hsh-rancher.legendars.de --set replicas=1 --set ingress.tls.source=letsEncrypt --set letsEncrypt.email=alexander.hampel@stud.hs-hannover.de --set letsEncrypt.ingress.class=traefik

kubectl -n cattle-system rollout status deploy/rancher

# Passwort bekommen
# kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}{{ "\n" }}'
echo https://hsh-rancher.legendars.de/dashboard/?setup=$(kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}')

# Longhorn installieren:
# https://pongzt.com/post/kube-cluster-k3s-longhorn/

# Longhorn
# Installation:
# Auf jedem Host:
sudo apt-get install open-iscsi

# Danach auf dem Master:
helm repo add longhorn https://charts.longhorn.io
helm repo update

kubectl create namespace longhorn-system
helm upgrade -i longhorn longhorn/longhorn --namespace longhorn-system

# Default-Path ändern:
sudo cp /var/lib/rancher/k3s/server/manifests/local-storage.yaml /var/lib/rancher/k3s/server/manifests/custom-local-storage.yaml
sudo sed -i -e "s/storageclass.kubernetes.io\/is-default-class: \"true\"/storageclass.kubernetes.io\/is-default-class: \"false\"/g" /var/lib/rancher/k3s/server/manifests/custom-local-storage.yaml



echo https://hsh-rancher.legendars.de/dashboard/?setup=$(kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}')

