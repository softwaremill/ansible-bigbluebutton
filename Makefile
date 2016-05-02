localtest:
	vagrant destroy -f
	vagrant up
	vagrant ssh -c 'cd /ansible/roles/ansible-bigbluebutton && . tests/test.sh'
	vagrant destroy -f
