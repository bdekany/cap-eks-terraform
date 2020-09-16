eval "$(jq -r '@sh "export KUBECONFIG=\(.kubeconfig)"')"
NAME=$(kubectl get svc nginx-ingress-controller | awk '{print$4}' | tail -1)
code=1
while [ $code -ne 0 ]
 do
	 host -t A $NAME > /dev/null
	 code=$?
	 sleep 3
 done
IP=$(host -t A $NAME | awk '{print$4}')
jq -n --arg ip $(echo $IP) '{"ip": $ip}'