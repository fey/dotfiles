install-ansible:
	sudo apt update
	sudo apt install software-properties-common
	sudo add-apt-repository --yes --update ppa:ansible/ansible
	sudo apt install -y ansible

install:
	cd ansible && ansible-galaxy collection install -r requirements.yml
	cd ansible && ansible-galaxy role install -r requirements.yml

prepare-ubuntu:
	cd ansible && ansible-playbook -i hosts  playbook.yml  -vv --ask-become-pass

show-facts:
	ansible -i ansible/hosts all -m setup
