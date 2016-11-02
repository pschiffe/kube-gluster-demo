#!/bin/bash

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

/usr/bin/dnf -y install python ansible https://kojipkgs.fedoraproject.org/packages/kubernetes-ansible/0.7.0/0.2.git1958461.fc26/noarch/kubernetes-ansible-0.7.0-0.2.git1958461.fc26.noarch.rpm

/usr/bin/ansible-playbook -i "${DIR}/inventory" "${DIR}/deploy-playbook.yml"
