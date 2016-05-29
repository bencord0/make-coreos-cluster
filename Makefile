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

.PHONY: help ping cluster destroy
