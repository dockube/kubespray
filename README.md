## **DocKube Kubespray**

DocKube Kubespray is a modification Kubespray for deployment Kubernetes with docker container.

### Why We Use DocKube ?
* We don't need Vagrant environment and/or VirtualBox (VBox).
* Replacement tools for Development Environment `MiniKube`.
* We can validate our Kubernetes Cluster before deploying to Baremetal and/our using Cloud Service Provider.
* Fast Provision, because using our own resources & docker container.

### Setup DocKube Kubespray
* Setup your own environment kubespray deployment in `kubespray.sh` file.
  ```
  ENV_KEY="0"                # Setup environment key private (0 = Not Used, 1 = DocKube, 2 = Staging, 3 = Production)
  VERBOSE_MODE="0"           # (0 = disable verbose mode, 1 = running verbose mode)
  VERBOSE_COMMAND="-vvv"

  INVENTORY_DOCKUBE="inventory/dockube/hosts.ini"
  INVENTORY_STAGING="inventory/k8s-staging/hosts.ini"
  INVENTORY_PRODUCTION="inventory/k8s-production/hosts.ini"

  DOCKUBE_PATH_KEY="/opt/keyserver/key-dockube.pem"
  STAGING_PATH_KEY="/opt/keyserver/key-staging.pem"
  PRODUCTION_PATH_KEY="/opt/keyserver/key-prod.pem"
  ```

### Running Kubespray Services
```
make [services]:
  - dockube-cluster:      Build K8S cluster in DocKube environment
  - dockube-remove:       Remove K8S cluster in DocKube environment
  - dockube-reset:        Reset all configuration K8S cluster in DocKube environment
  - dockube-scale:        Scale new K8S cluster in DocKube environment
  - dockube-upgrade:      Upgrade K8S cluster in DocKube environment

  - staging-cluster:      Build K8S cluster in Staging environment
  - staging-remove:       Remove K8S cluster in Staging environment
  - staging-reset:        Reset all configuration K8S cluster in Staging environment
  - staging-scale:        Scale new K8S cluster in Staging environment
  - staging-upgrade:      Upgrade K8S cluster in Staging environment

  - production-cluster:   Build K8S cluster in Production environment
  - production-remove:    Remove K8S cluster in Production environment
  - production-reset:     Reset all configuration K8S cluster in Production environment
  - production-scale:     Scale new K8S cluster in Production environment
  - production-upgrade:   Upgrade K8S cluster in Production environment
```