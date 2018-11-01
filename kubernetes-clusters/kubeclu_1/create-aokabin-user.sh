# kubectl create namespace office
openssl genrsa -out aokabin.key 2048
openssl req -new -key aokabin.key -out aokabin.csr -subj "/CN=aokabin/O=nkmrlab"
openssl x509 -req -in aokabin.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out aokabin.crt -days 9999
kubectl config set-credentials aokabin --client-certificate=/root/keys/aokabin.crt  --client-key=/root/keys/aokabin.key
kubectl config set-context aokabin-context --cluster=kubernetes --user=aokabin # --namespace=office 
kubectl --context=aokabin-context get pods