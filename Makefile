COMPOSE=docker-compose.yaml

all: $(COMPOSE) clear
	docker-compose -f $(COMPOSE) up -d --build

stop: $(COMPOSE)
	docker-compose -f $(COMPOSE) stop

clear: $(COMPOSE)
	docker-compose -f $(COMPOSE) rm -fsv

run: $(COMPOSE)
	docker-compose -f $(COMPOSE) up -d --build

tests/technopark-dbms-forum: tests/main.go
	cd tests && go build

func-tests: tests/technopark-dbms-forum
	./tests/technopark-dbms-forum func -u http://localhost:8080/api

load-tests: tests/technopark-dbms-forum
	./tests/technopark-dbms-forum fill --url=http://localhost:8080/api --timeout=900

perf-tests: tests/technopark-dbms-forum
	./tests/technopark-dbms-forum perf --url=http://localhost:8080/api --duration=600 --step=60
