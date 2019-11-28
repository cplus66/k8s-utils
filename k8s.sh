#!/bin/bash
# Date: Nov 28, 2019
# Author: cplus.shen
# Description: Useful commands to configure kubernetes

if [ x"$MICROK8S" != "x" ]; then
    MICROK8S=microk8s.
fi

case "$1" in
    microk8s-install)
    sudo snap install microk8s --classic
    sudo microk8s.enable dashboard dns
    ;;

    get-all)
    sudo ${MICROK8S}kubectl get all --all-namespaces
    ;;

    get-token)
    token=$(sudo microk8s.kubectl -n kube-system get secret | grep default-token | cut -d " " -f1)
    sudo ${MICROK8S}kubectl -n kube-system describe secret $token
    ;;

    cluster-info)
    sudo ${MICROK8S}kubectl cluster-info
    ;;

    *)
    echo "Usage: MICROK8S=y $0 { microk8s-install | get-all | get-token | cluster-info }"
    ;;
esac
