# -----------------------------------------------------------------------------
#  MAKEFILE RUNNING COMMAND
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni (@zeroc0d3)
#  Repository : https://github.com/dockube/dockube
#  License    : MIT
# -----------------------------------------------------------------------------
# Notes:
# use [TAB] instead [SPACE]

dockube-cluster:
	./kubespray-cmd.sh dockube-cluster

dockube-remove:
	./kubespray-cmd.sh dockube-remove

dockube-reset:
	./kubespray-cmd.sh dockube-reset

dockube-scale:
	./kubespray-cmd.sh dockube-scale

dockube-upgrade:
	./kubespray-cmd.sh dockube-upgrade

#------------------------
staging-cluster:
	./kubespray-cmd.sh k8s-staging-cluster

staging-remove:
	./kubespray-cmd.sh k8s-staging-remove

staging-reset:
	./kubespray-cmd.sh k8s-staging-reset

staging-scale:
	./kubespray-cmd.sh k8s-staging-scale

staging-upgrade:
	./kubespray-cmd.sh k8s-staging-upgrade

#------------------------
production-cluster:
	./kubespray-cmd.sh k8s-production-cluster

production-remove:
	./kubespray-cmd.sh k8s-production-remove

production-reset:
	./kubespray-cmd.sh k8s-production-reset

production-scale:
	./kubespray-cmd.sh k8s-production-scale

production-upgrade:
	./kubespray-cmd.sh k8s-production-remove

#------------------------
mitogen:
	ansible-playbook -c local mitogen.yaml -vv
clean:
	rm -rf dist/
	rm *.retry
