#!/bin/ash

#check/install ansible and sshpass
apk add ansible
apk add sshpass

#get the hosts ip addresses from user
echo "Enter host 1's ip address: "
read host1

echo "Enter host 2's ip address: "
read host2

#generate rsa key for the hosts
ssh-keygen -t rsa

#copy the keys to the hosts for ssh connection 
#make sure the hosts allow ssh root login in sshd_cofig
ssh-copy-id -i /root/.ssh/id_rsa root@$host1

ssh-copy-id -i /root/.ssh/id_rsa root@$host2

#run the ansible playbook
ansible-palybook playbook.yaml -i ./hosts.ini

#return contents of index.html from index.html
curl $host1 
curl $host2

