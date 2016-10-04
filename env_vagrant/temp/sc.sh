echo "installing packages"
yum install -y policycoreutils-python-2.2.5-20.el7.x86_64 wget unzip
echo "enabling module selinux"
semodule -i /temp/vault.pp
echo "adding user"
useradd --system vault -Z system_u
echo "installing gg"
tar xvfz /temp/go1.7.1.linux-amd64.tar.gz -C /usr/local/
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/bashrc
source /etc/bashrc
echo "installing vault"
mkdir /etc/vault
cp /temp/vault.json /etc/vault/
cp /temp/vault /etc/init.d/vault
chkconfig --add vault
wget https://releases.hashicorp.com/vault/0.6.1/vault_0.6.1_linux_amd64.zip -O /tmp/vault.zip
unzip /tmp/vault.zip -d /usr/sbin
setcap cap_ipc_lock=+ep $(readlink -f $(which vault))
echo "adding portS"
restorecon -v /usr/sbin/vault
semanage port -a -t vault_port_t -p tcp 5200

