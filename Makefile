PRJ_NAME=dbruby

build:
	docker-compose down; docker-compose build
run:
	docker-compose up

mysql:
	docker exec -it ${PRJ_NAME}_db_1 sh -c 'mysql -uroot -p$${MYSQL_ROOT_PASSWORD} $${MYSQL_DATABASE}'
