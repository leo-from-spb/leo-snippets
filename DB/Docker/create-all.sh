docker pull postgres:9.0
docker pull postgres:9.1
docker pull postgres:9.2
docker pull postgres:9.3
docker pull postgres:9.4
docker pull postgres:9.5
docker pull postgres:9.6

docker create --name postgres.9.0 -p 1090:5432 -e POSTGRES_DB=testing -e POSTGRES_USER=tester -e POSTGRES_PASSWORD=test postgres:9.0
docker create --name postgres.9.1 -p 1091:5432 -e POSTGRES_DB=testing -e POSTGRES_USER=tester -e POSTGRES_PASSWORD=test postgres:9.1
docker create --name postgres.9.2 -p 1092:5432 -e POSTGRES_DB=testing -e POSTGRES_USER=tester -e POSTGRES_PASSWORD=test postgres:9.2
docker create --name postgres.9.3 -p 1093:5432 -e POSTGRES_DB=testing -e POSTGRES_USER=tester -e POSTGRES_PASSWORD=test postgres:9.3
docker create --name postgres.9.4 -p 1094:5432 -e POSTGRES_DB=testing -e POSTGRES_USER=tester -e POSTGRES_PASSWORD=test postgres:9.4
docker create --name postgres.9.5 -p 1095:5432 -e POSTGRES_DB=testing -e POSTGRES_USER=tester -e POSTGRES_PASSWORD=test postgres:9.5
docker create --name postgres.9.6 -p 1096:5432 -e POSTGRES_DB=testing -e POSTGRES_USER=tester -e POSTGRES_PASSWORD=test postgres:9.6
