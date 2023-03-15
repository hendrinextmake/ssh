#SSH
FROM ubuntu:latest

# Install SSH server
RUN apt update && apt install openssh-server sudo -y
RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup sshuser
RUN sed -i "s/#PubkeyAuthentication yes/PubkeyAuthentication yes/" /etc/ssh/sshd_config

RUN echo "AllowUsers sshuser" >> /etc/ssh/sshd_config
RUN echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config
RUN sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin no/" /etc/ssh/sshd_config
RUN sed -i "s/#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
RUN sed -i "s/#LogLevel INFO/LogLevel DEBUG3/" /etc/ssh/sshd_config

#tes
RUN sed -i "s/#Port 22/Port 10022/" /etc/ssh/sshd_config
# RUN echo "AuthorizedKeysFile     /home/sshuser/.ssh/authorized_keys" >> /etc/ssh/sshd_config
#tes
RUN echo "HostkeyAlgorithms=+ssh-rsa" >> /etc/ssh/sshd_config
RUN echo "PubkeyAcceptedAlgorithms=+ssh-rsa" >> /etc/ssh/sshd_config




# RUN "sshuser:password" | chpasswd

# Register public key
RUN mkdir -p /home/sshuser/.ssh

COPY ssh/id_ed25519.pub /home/sshuser/.ssh/id_ed25519.pub
COPY ssh/docker-entrypoint.sh /home/sshuser/.ssh/

RUN chmod +x /home/sshuser/.ssh/docker-entrypoint.sh
RUN /home/sshuser/.ssh/docker-entrypoint.sh

EXPOSE 10022

CMD service ssh start && /bin/bash

