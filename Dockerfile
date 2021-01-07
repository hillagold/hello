From ubuntu
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y \
build-essential cmake \
mosquitto \
cmake \
python3 \
python3-pip \
ansible \ 
openssh-server \ 
snapd
#RUN snap install aws-cli
RUN python3 -m pip install conan boto
RUN conan remote add community https://api.bintray.com/conan/conan-community/conan
RUN sed -i 's|session required pam_loginuid.so|session optional pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd
RUN apt-get install -y openjdk-8-jdk
RUN adduser --quiet jenkins
RUN echo "jenkins:jenkins" | chpasswd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
#Run aws configure
