EMAIL=ludovicdop@gmail.com
DOMAIN=ludovicdoppler.fr

build:
	docker compose build

up:
	docker compose up -d

cert:
	docker compose run --rm certbot

reload:
	docker compose exec nginx_proxy nginx -s reload

down:
	docker compose down

logs:
	docker compose logs -f
