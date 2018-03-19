FROM cits/oci8:latest

RUN cd /tmp \
	&& curl https://releases.hashicorp.com/consul-template/0.18.5/consul-template_0.18.5_linux_amd64.tgz -o consul-template.tgz \
	&& gunzip consul-template.tgz \
	&& tar -xf consul-template.tar \
	&& mv consul-template /opt/consul-template \
	&& rm -rf /tmp/consul-template*

WORKDIR /opt

CMD /opt/consul-template   -template="$CONSUL_TEMPLATE_URL:/opt/conn.inc.php" -once -consul-addr=$CONSUL_HTTP_ADDR     -vault-addr=$VAULT_ADDR     -vault-token=$VAULT_TOKEN 	-vault-renew-token=false   -log-level=debug  -exec "bash" && php $PHP_SCRIPTNAME




