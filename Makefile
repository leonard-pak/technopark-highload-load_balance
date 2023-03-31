all: docker-compose.yaml clear
	docker-compose up -d --build

stop:
	docker-compose stop

clear:
	docker-compose rm -fsv

run: docker-compose.yaml
	docker-compose up -d --build
