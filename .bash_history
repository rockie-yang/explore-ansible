history 
exit
ls
cd 
ls
cd playbooks/
ls
cat hosts 
ansible localuser -i hosts -m ping -vvvv
service ssh start
ansible localuser -i hosts -m ping -vvvv
ansible localuser -i hosts -m ping -vvvv
ansible localuser -i hosts -m ping
pwd
cd ..
ls
ansible localuser -i playbooks/hosts -m ping
vi 
vi /etc/ansible/ansible.cfg 
ansible localuser -i playbooks/hosts -m ping
cd playbooks/
ansible localuser -i hosts -m ping
cd ..
ansible localuser -m ping
ansible localhost -m ping
ansible localuser -i hosts -m ping -c uptime
pwd
ansible localuser -i playbooks/hosts -m ping -c uptime
ansible localuser -i playbooks/hosts -m command -a uptime
pwd
pwd
ansible localuser -i playbooks/hosts -a uptime
ansible localuser -i playbooks/hosts -a lsb_release
ip 
ip addr
ansible localuser -i playbooks/hosts -a ip addr
ansible localuser -i playbooks/hosts -a 'ip addr'
ansible localuser -i playbooks/hosts -a "ip addr"
ansible localuser -i playbooks/hosts -a `ip addr`
ansible localuser -i playbooks/hosts -a {ip addr}
ansible localuser -i playbooks/hosts -a "tail /var/log/syslog"
ansible localuser -i playbooks/hosts -b -a "tail /var/log/syslog"
pwd
tail /var/log/alternatives.log 
su user
ansible localuser -i playbooks/hosts -b -a "cat /etc/shadow"
ansible localuser -i playbooks/hosts -b -a "cat /etc/shadows"
ansible localuser -i playbooks/hosts -b -a "cat /etc/shadow"
cat /etc/shadow
su user
apt-get install sudo
ansible localuser -i playbooks/hosts -b -a "cat /etc/shadow"
su user
usermod -aG sudo user
su user
ls
cat /etc/sudoers
sudoers
groups
su user
visudo 
su user
echo 'user\nuser' | passwd user
passwd user
su user
ansible localuser -i playbooks/hosts -b -a "cat /etc/shadow"
visudo 
ansible localuser -i playbooks/hosts -b -a "cat /etc/shadow"
cat /etc/shadow
su user
ansible localuser -i playbooks/hosts -b -a "cat /etc/shadow"
ansible localuser -i playbooks/hosts -b -m apt -a name=ngix
ansible localuser -i playbooks/hosts -b -m apt -a name=nginx
ansible localuser -i playbooks/hosts -b -m apt -a name=nginx
su user
history 
cat /etc/sudoers
doc
exit
