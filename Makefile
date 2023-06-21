.PHONY: bootstrap clean

bootstrap:

	openssl genrsa -out server.key 2048

	openssl req -x509 -subj '/OU=IT/OU=Hosts/CN=httpd.example.com' \
		-addext 'subjectAltName = DNS:httpd.example.com' \
		-sha256 -new -nodes -key server.key -days 7300 -out server.crt

clean:
	$(RM) server.key server.crt
