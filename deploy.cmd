@ECHO OFF

ECHO BUILD RESTORE APP1
CD App1
dotnet restore
ECHO PUBLIC SOURCE APP1
dotnet publish -o obj/Docker/publish
ECHO DOCKER BUILD SOURCE CODE
CD ..
docker build -t app1name app1
ECHO BUILDED.
docker images

ECHO BUILD RESTORE APP2
CD App2
dotnet restore
ECHO PUBLIC SOURCE APP2
dotnet publish -o obj/Docker/publish
ECHO DOCKER BUILD SOURCE CODE
CD ..
docker build -t app2name app2
ECHO BUILDED.
docker images

ECHO RUN DOCKER
docker network create my-net
docker rm app1 --force
docker run --rm -d --network my-net -p 5001:81 --name app1 app1name
docker rm app2 --force
docker run --rm -d --network my-net -p 5000:80 --name app2 app2name
ECHO DEPLOYED.
docker ps
PAUSE