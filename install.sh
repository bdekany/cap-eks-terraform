#!/bin/bash
#eval "$(jq -r '@sh "export KUBECONFIG=\(.kubeconfig)"')"

##
# $KUBECONFIG and $VERSION come from terraform

OS=$(uname | tr '[:upper:]' '[:lower:]')
RELEASE_URL="https://github.com/epinio/epinio/releases/download/${VERSION}/epinio-${OS}-amd64"

curl -LO $RELEASE_URL
chmod +x epinio-${OS}-amd64

./epinio-${OS}-amd64 install-ingress
NAME=$(kubectl get svc traefik -n traefik | awk '{print$4}' | tail -1)
code=1
while [ $code -ne 0 ]
 do
	 echo "Waiting IP ADDR for ${NAME}"
	 OUTPUT=$(host -t A $NAME)
	 code=$?
	 sleep 3
 done
IP=$(echo $OUTPUT | awk '{print$4}')
#jq -n --arg ip $(echo $IP) '{"ip": $ip}'

./epinio-${OS}-amd64 install --system-domain ${IP}.nip.io
