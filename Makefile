start:
	docker-compose up

build:
	docker-compose -f docker-compose.setup.yml run --rm keystore
	docker-compose -f docker-compose.setup.yml run --rm certs

fresh:
	make setup
	make start

load:
	docker-compose -f docker-compose.setup.yml run --rm loaddata