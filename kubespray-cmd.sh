#!/usr/bin/env sh
# -----------------------------------------------------------------------------
#  OPTION COMMAND - KUBESPRAY DEPLOYMENT
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni (@zeroc0d3)
#  Repository : https://github.com/dockube/dockube
#  License    : MIT
# -----------------------------------------------------------------------------

case $1 in

    ### DOCKUBE ###
    dockube-cluster)
        echo "### Build DocKube K8S Cluster ###"
        ./kubespray.sh dockube-build-cluster
        ;;

    dockube-remove)
        echo "### Remove DocKube K8S Cluster ###"
        ./kubespray.sh dockube-remove-cluster
        ;;

    dockube-reset)
        echo "### Reset DocKube K8S Cluster ###"
        ./kubespray.sh dockube-reset-cluster
        ;;

    dockube-scale)
        echo "### Scale DocKube K8S Cluster ###"
        ./kubespray.sh dockube-scale-cluster
        ;;

    dockube-upgrade)
        echo "### Upgrade DocKube K8S Cluster ###"
        ./kubespray.sh dockube-upgrade-cluster
        ;;


    ### K8S STAGING ###
    k8s-staging-cluster)
        echo "### Build Kubespray K8S Cluster (Staging) ###"
        ./kubespray.sh staging-build-cluster
        ;;

    k8s-staging-remove)
        echo "### Remove Kubespray K8S Cluster (Staging) ###"
        ./kubespray.sh staging-remove-cluster
        ;;

    k8s-staging-reset)
        echo "### Reset Kubespray K8S Cluster (Staging) ###"
        ./kubespray.sh staging-reset-cluster
        ;;

    k8s-staging-scale)
        echo "### Scale Kubespray K8S Cluster (Staging) ###"
        ./kubespray.sh staging-scale-cluster
        ;;

    k8s-staging-upgrade)
        echo "### Upgrade Kubespray K8S Cluster (Staging) ###"
        ./kubespray.sh staging-upgrade-cluster
        ;;


    ### K8S PRODUCTION ###
    k8s-production-cluster)
        echo "### Build Kubespray K8S Cluster (Production) ###"
        ./kubespray.sh production-build-cluster
        ;;

    k8s-production-remove)
        echo "### Remove Kubespray K8S Cluster (Production) ###"
        ./kubespray.sh production-remove-cluster
        ;;

    k8s-production-reset)
        echo "### Reset Kubespray K8S Cluster (Production) ###"
        ./kubespray.sh production-reset-cluster
        ;;

    k8s-production-scale)
        echo "### Scale Kubespray K8S Cluster (Production) ###"
        ./kubespray.sh production-scale-cluster
        ;;

    k8s-production-upgrade)
        echo "### Upgrade Kubespray K8S Cluster (Production) ###"
        ./kubespray.sh production-upgrade-cluster
        ;;

esac