SERVICE = ejabberd
REGGAE_PATH = /usr/local/share/reggae
PORTS = 3478 5222 5269 5280 5443 7777 49152:65535
EXTRA_DOMAINS = example.net

post_setup_ansible:
	@echo "jabber_domain: ${FQDN}" >>ansible/group_vars/all
	@echo -e "jabber_domains:" >>ansible/group_vars/all
	@echo -e "  - ${FQDN}" >>ansible/group_vars/all
.for domain in ${EXTRA_DOMAINS}
	@echo -e "  - ${domain}" >>ansible/group_vars/all
.endfor

.include <${REGGAE_PATH}/mk/service.mk>
