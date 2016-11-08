# Kubernetes with gluster demo

Demo with Kubernetes deployed by ansible scripts from [kubernetes-contrib](https://github.com/kubernetes/contrib/tree/master/ansible) repository (packaged as RPM in Fedora), with [gluster](https://www.gluster.org/) used for persistent volumes, where gluster itself is running as a service in kubernetes, with [cockpit](http://cockpit-project.org/) as a web management interface and a [wordpress](https://wordpress.org/) example application.

## Requirements

You will need at least 2 virtual machines running recent Fedora (24+) with python 2 installed (`dnf install python`). You should also have proper DNS resolution working between the instances (`/etc/hosts` file should be enough).

## Usage

The deployment is intended to by run from the master instance.

```
dnf install git
git clone https://github.com/pschiffe/kube-gluster-demo.git
cd kube-gluster-demo
vi inventory  # Edit inventory file to suit your needs
./deploy.sh
```

After the deployment is done, cockpit should be listening on port `9090` on the master instance. Log in to the cockpit interface and register 2 gluster volumes (Cluster -> Volumes -> Register new volume; type gluster, name vol1 and vol2 endpoint gluster-service-vol1 and gluster-service-vol2). Now you can just deploy wordpress app with `kubectl create -f  	wp-demo.yml`.
