useradd stack
yum install epel-release -y
yum install python-pip -y
systemctl disable firewalld
systemctl stop firewalld
pip install six==1.8.0
cp /vagrant/sudoers /etc/
cd /home/stack
sudo -u stack git clone https://git.openstack.org/openstack-dev/devstack
cp /vagrant/local.conf ./devstack
cp /vagrant/stack.sh ./devstack
cd ./devstack
sudo -u stack ./stack.sh
source /home/stack/devstack/openrc admin
iptables -X
iptables -F
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
cd ../
#wget https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-amd64-disk1.img
#glance image-create --name "ubuntu-trusty" --disk-format qcow2 --container-format bare --is-public True --visibility public --protected True --file trusty-server-cloudimg-amd64-disk1.img --progress