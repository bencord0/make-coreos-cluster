help:
	# make ping - test connectivity
	# make cluster - launch gce instances
	# make destroy - destroy gce instances

ping:
	ansible-playbook -v -i gce.py ping.yaml

cluster:
	ansible-playbook -v -i gce.py cluster.yaml

destroy:
	ansible-playbook -v -i gce.py destroy.yaml

fleetctl-env:
	@echo export FLEETCTL_TUNNEL=$(shell ./gce.py --list | jq '._meta.hostvars."core-1".ansible_ssh_host'|xargs echo)
	@echo export FLEETCTL_SSH_USERNAME=core

.PHONY: help ping cluster destroy fleetctl-env
