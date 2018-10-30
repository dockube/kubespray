#!/usr/bin/env sh
# -----------------------------------------------------------------------------
#  KUBESPRAY DEPLOYMENT SCRIPT
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni (@zeroc0d3)
#  Repository : https://github.com/dockube/dockube
#  License    : MIT
# -----------------------------------------------------------------------------

ENV_KEY="0"                # Setup environment key private (0 = Not Used, 1 = DocKube, 2 = Staging, 3 = Production)
VERBOSE_MODE="0"           # (0 = disable verbose mode, 1 = running verbose mode)
VERBOSE_COMMAND="-vvv"

INVENTORY_DOCKUBE="inventory/dockube/hosts.ini"
INVENTORY_STAGING="inventory/k8s-staging/hosts.ini"
INVENTORY_PRODUCTION="inventory/k8s-production/hosts.ini"

DOCKUBE_PATH_KEY="/opt/keyserver/key-dockube.pem"
STAGING_PATH_KEY="/opt/keyserver/key-staging.pem"
PRODUCTION_PATH_KEY="/opt/keyserver/key-prod.pem"

CMD_PRIV_KEY="--private-key="

verbose_mode() {
  if [ "$VERBOSE_MODE" = "0" ]
  then
    VERBOSE_COMMAND=""
  fi
}

set_key() {
  if [ "$ENV_KEY" = "0" ]
  then
    CMD_PRIV_KEY=""
    PRIV_KEY_PATH=""
  elif [ "$ENV_KEY" = "1" ]
  then
    PRIV_KEY_PATH=$DOCKUBE_PATH_KEY
  elif [ "$ENV_KEY" = "2" ]
  then
    PRIV_KEY_PATH=$STAGING_PATH_KEY
  else
    PRIV_KEY_PATH=$PRODUCTION_PATH_KEY
  fi
}

set_roles_dockube() {
    rm -f ./roles
    ln -sf ./roles_dockube ./roles
}

set_roles_global() {
    rm -f ./roles
    ln -sf ./roles_global ./roles
}

running_ansible() {
    verbose_mode
    set_key
    ansible-playbook -i $INVENTORY --become --become-user=root $ROLE --flush-cache $VERBOSE_COMMAND $CMD_PRIV_KEY$PRIV_KEY_PATH
}

case $1 in

    ### DOCKUBE ###
    dockube-build-cluster)
        INVENTORY=$INVENTORY_DOCKUBE
        ROLE="cluster.yml"
        set_roles_dockube
        ;;

    dockube-remove-cluster)
        INVENTORY=$INVENTORY_DOCKUBE
        ROLE="remove-node.yml"
        set_roles_dockube
        ;;

    dockube-reset-cluster)
        INVENTORY=$INVENTORY_DOCKUBE
        ROLE="reset.yml"
        set_roles_dockube
        ;;

    dockube-scale-cluster)
        INVENTORY=$INVENTORY_DOCKUBE
        ROLE="scale.yml"
        set_roles_dockube
        ;;

    dockube-upgrade-cluster)
        INVENTORY=$INVENTORY_DOCKUBE
        ROLE="upgrade.yml"
        set_roles_dockube
        ;;

    ### K8S STAGING ###
    staging-build-cluster)
        INVENTORY=$INVENTORY_STAGING
        ROLE="cluster.yml"
        set_roles_global
        ;;

    staging-remove-cluster)
        INVENTORY=$INVENTORY_STAGING
        ROLE="remove-node.yml"
        set_roles_global
        ;;

    staging-reset-cluster)
        INVENTORY=$INVENTORY_STAGING
        ROLE="reset.yml"
        set_roles_global
        ;;

    staging-scale-cluster)
        INVENTORY=$INVENTORY_STAGING
        ROLE="scale.yml"
        set_roles_global
        ;;

    staging-upgrade-cluster)
        INVENTORY=$INVENTORY_STAGING
        ROLE="upgrade.yml"
        set_roles_global
        ;;

    ### K8S PRODUCTION ###
    production-build-cluster)
        INVENTORY=$INVENTORY_PRODUCTION
        ROLE="cluster.yml"
        set_roles_global
        ;;

    production-remove-cluster)
        INVENTORY=$INVENTORY_PRODUCTION
        ROLE="remove-node.yml"
        set_roles_global
        ;;

    production-reset-cluster)
        INVENTORY=$INVENTORY_PRODUCTION
        ROLE="reset.yml"
        set_roles_global
        ;;

    production-scale-cluster)
        INVENTORY=$INVENTORY_PRODUCTION
        ROLE="scale.yml"
        set_roles_global
        ;;

    production-upgrade-cluster)
        INVENTORY=$INVENTORY_PRODUCTION
        ROLE="upgrade.yml"
        set_roles_global
        ;;

esac

running_ansible
