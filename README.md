Custom Jenkins image with docker and the plugins pre-installed

build docker image

docker build -t jenkins:jcasc .

run docker

docker run --name jenkins --rm -p 8080:8080 --env JENKINS_ADMIN_ID=admin --env JENKINS_ADMIN_PASSWORD=password jenkins:jcasc


