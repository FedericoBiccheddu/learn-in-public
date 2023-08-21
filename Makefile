include .env

setup: setup/env setup/proxy/certificates

MKCERT_INSTALLED := $(shell mkcert -version 2>/dev/null)
setup/mkcert:
ifdef MKCERT_INSTALLED
	$(info mkcert already installed)
else
	$(error mkcert not installed. Install manually: https://github.com/FiloSottile/mkcert#installation)
endif

setup/env: .env.dist
ifeq ($(wildcard .env),)
	$(info .env file created)
	@cp .env.dist .env
else
	$(info .env file already exists, skipping)
endif
	@:

setup/proxy/certificates: setup/mkcert
	@mkdir -p \
		config/proxy/certificate
	@mkcert -install
	@mkcert \
		-cert-file config/proxy/certificate/cert.pem \
		-key-file config/proxy/certificate/key.pem \
		"$(PROJECT_DOMAIN)" \
		"*.$(PROJECT_DOMAIN)"
