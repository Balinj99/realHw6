#!/bin/ash

#check/install ansible and sshpass
apk add ansible
apk add sshpass

#generate rsa key for the hosts
ssh-keygen -t rsa
#figure out how to do the input

#copy the keys to the hosts for ssh connection 
#make sure the hosts allow ssh root login in sshd_cofig
ssh-copy-id -i /root/.ssh/id_rsa root@192.168.1.xxx
ssh-copy-id -i /root/.ssh/id_rsa root@192.168.1.yyy
#figure out passowd entry

#run the ansible playbook
ansible-palybook playbook.yaml -i ./hosts.ini

#return contents of index.html from index.html
curl 192.168.1.xxx
curl 192.168.1.yyy

