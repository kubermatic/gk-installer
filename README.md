# gk-installer
Installer for [gluster/gluster-kubernetes](https://github.com/gluster/gluster-kubernetes)

## Usage
The installer expects that you are running the container in the Kubernetes cluster you intend to deploy gluster-kubernetes to. It also expects that you will mount your topology file to /etc/gk-deploy/topology.json (i.e. via ConfigMap)

The repo includes an example ConfigMap and Job for deployment
