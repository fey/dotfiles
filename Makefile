install-ansible:
	apt update
	apt install software-properties-common
	add-apt-repository --yes --update ppa:ansible/ansible
	apt install -y ansible make

install-deps:
	cd ansible && ansible-galaxy collection install -r requirements.yml
	cd ansible && ansible-galaxy role install -r requirements.yml

prepare-ubuntu:
	cd ansible && ansible-playbook -i hosts  playbook.yml  -vv --ask-become-pass

print-facts:
	ansible -i ansible/hosts all -m setup

lint:
	ansible-lint -p ansible/playbook.yml --exclude=../../.ansible
