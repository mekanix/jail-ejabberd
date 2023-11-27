SERVICE = ejabberd
REGGAE_PATH = /usr/local/share/reggae
PORTS = 3478 5222 5269 5280 5443 7777 49152:65535

post_setup_ansible:
	@echo "jabber_domain: ${FQDN}" >>ansible/group_vars/all

.include <${REGGAE_PATH}/mk/service.mk>
