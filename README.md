# k8s-utils
Collect useful command for install and manage K8S cluster

## Usage
./k8s.sh { microk8s-install | get-all | get-token | cluster-info }

## Accessing Kubernetes Service Network via SSH
ssh -L 50001:10.152.183.250:443 ubuntu@172.17.5.120

- 50001: source port for connect to K8S dashboard
- 10.152.183.250:443: service/kubernetes-dashboard
- ubuntu@172.17.5.120: Kubernetes Host 
```
kube-system   service/kubernetes-dashboard        ClusterIP   10.152.183.250   <none>        443/TCP
```

### Putty
Connection > SSH > Tunnel
```
Source Port: 50001
Destination: 10.152.183.250:443 K8S Dashboard Service  /* Press "Add" button */
```

## Reference
- https://unix.stackexchange.com/questions/115897/whats-ssh-port-forwarding-and-whats-the-difference-between-ssh-local-and-remot
- https://blog.devolutions.net/2017/4/how-to-configure-an-ssh-tunnel-on-putty

Connect application with service
- https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/
