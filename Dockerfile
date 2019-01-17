FROM debian:9

RUN apt-get update -y \
    && apt-get install -y python3 python3-pip curl vim ssh openssh-server sudo

RUN pip3 install jupyter

RUN apt-get install -y ansible

RUN echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale

RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa \
  && cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys \
  && sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config \
  && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
  && echo "UsePAM no" >> /etc/ssh/sshd_config \
  && ssh-keygen -A \
  && service ssh start \
  && update-rc.d ssh defaults

ADD ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
RUN chown root:root /root/.ssh/config

RUN echo 'root\nroot' | passwd

## The default sh has some issue e.g. with source
## so explicityly change it to bash as the default
##
RUN ls -al /bin/sh \
	&& rm /bin/sh \
	&& ln -sf /bin/bash /bin/sh

EXPOSE 22

RUN useradd -ms /bin/bash -p ansible ansible \
	&& useradd -ms /bin/bash -p test test \
	&& echo "ansible    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
	&& echo "test    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
	&& su ansible && exit \
	&& su test && exit
 	 	
USER ansible

RUN mkdir -p /home/ansible/.ssh/

COPY id_rsa.pub /home/ansible/.ssh/authorized_keys

USER root

# ENTRYPOINT service ssh start && bash

CMD ["/usr/sbin/sshd", "-D"]