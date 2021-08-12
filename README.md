# Vagrant-Machine-Ornikar
## Deployment of the Virtual Machine (VM) :
This is to create multiple virtual machines using vagrant script.

Vagrant enables users to create and configure lightweight, reproducible, and portable development environments [ click here for more details](https://www.vagrantup.com/?). 

### First clone the projet and Build a VM

to clone the project.

$ git clone https://github.com/sory89/Vagrant-Machine-Ornikar.git

$ cd Vagrant-Machine-Ornikar

This command will launch the build and create a VM

$ vagrant up 

This stop the VM

$ vagrant halt

to delete the VM

$ vagrant delete --force

### After Build a VM

I use  [mobaxterm](https://mobaxterm.mobatek.net/?) the connect on the instance of the VM with the IP adress of the machine.

### Code.

This will create one virtual machines with IP adress 192.168.100.200, the size is 8 GB memory and 2 CPUs.

---
  instances: 1
  provider: virtualbox
  name_prefix: server0
  name_suffix: .tech-sory.com
  ip_prefix: 192.168.100.20
  storage_devices: 2
  disk_size: 20G
  memory: 8192
  cpus: 2
  box: ubuntu/bionic64
  path: bootstrap.sh
  

The script bootstrap.sh is to make provisionning (here I install Helm, Kubernetes with Minikube, and other package ...)
