NGINX_IMAGE = nginx-1
all: 
	docker build -t $(NGINX_IMAGE) -f ./site/Dockerfile ./site/
	docker compose up -d
