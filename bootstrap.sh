echo "[TASK 1] Create user admin ans password"
useradd  -mG wheel admin
echo itversity | passwd admin --stdin

#sudo echo "192.168.100.200 server00.tech-sory.com server00 kubespray" >> /etc/hosts

echo "[TASK 2] Update /etc/hosts file"
sudo cat >>/etc/hosts<<EOF
192.168.100.200 server00.tech-sory.com server00 minikube
EOF

echo "[TASK 3] Update package and install some package"
sudo apt-get install epel-release -y
sudo apt-get update -y

sudo apt-get install python3-pip -y
#NTP INSTALL
sudo apt-get install ntp

sudo timedatectl set-timezone Europe/Paris

#INSTALL VIM
sudo apt-get install -y vim

echo "[TASK 4] Enable ssh root login"
sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sed -i '/StrictHostKeyChecking/s/^#//; /StrictHostKeyChecking/s/ask/no/' /etc/ssh/ssh_config

sed -i "s/%wheel\tALL=(ALL)\tALL/# %wheel\tALL=(ALL)\tALL/g" /etc/sudoers
sed -i "s/# %wheel\tALL=(ALL)\tNOPASSWD: ALL/%wheel\tALL=(ALL)\tNOPASSWD: ALL/g" /etc/sudoers

#Install Lynx
sudo apt-get install lynx -y

#Install kubectl

curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.22.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#Install Minikube

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube

sudo mv ./minikube /usr/local/bin/minikube


#Install npm 
sudo apt-get install npm -y

#Install Docker
sudo apt install docker.io -y
sudo usermod -aG docker $USER

#Start minikube
sudo minikube start --force --driver=docker

#Install Helm
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

#Install Interface Graphic
#sudo apt-get install ubuntu-desktop -y
sudo apt-get install xubuntu-desktop -y
sudo apt-get install xubuntu-icon-theme -y
sudo apt-get install xfce4 -y
sudo apt-get install xrdp -y
sudo apt-get install xorg -y

#systemctl enable ntpd
#systemctl start ntpd
service sshd restart
