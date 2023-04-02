all: docker-compose.yaml clear
	docker-compose up -d --build

stop:
	docker-compose stop

clear:
	docker-compose rm -fsv

run: docker-compose.yaml
	docker-compose up -d --build

tests/technopark-dbms-forum: tests/main.go
	cd tests && go build

func-tests: tests/technopark-dbms-forum
	./tests/technopark-dbms-forum func -u http://localhost:8080/api

load-tests: tests/technopark-dbms-forum
	./tests/technopark-dbms-forum fill --url=http://localhost:8080/api --timeout=900

perf-tests: tests/technopark-dbms-forum
	./tests/technopark-dbms-forum perf --url=http://localhost:8080/api --duration=600 --step=60
