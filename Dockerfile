FROM jenkins/jenkins:lts
USER root
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
#RUN apt-get update && \
#    apt-get -y install apt-transport-https \
#      ca-certificates \
#      curl \
#      gnupg2 \
#      software-properties-common && \
#    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
#    add-apt-repository \
#      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
#      $(lsb_release -cs) \
#      stable" && \
#   apt-get update && \
#   apt-get -y install docker-ce

# install jenkins plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY casc.yaml /var/jenkins_home/casc.yaml