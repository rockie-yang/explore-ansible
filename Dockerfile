FROM debian:9

RUN apt-get update -y \
    && apt-get install -y python3 python3-pip curl vim ssh openssh-server

RUN pip3 install jupyter

RUN apt-get install -y ansible

#
# There is a bug on docker container when using overlay storage driver. 
# It can not evaluate control path to real value ControlPath=/root/.ansible/cp/ansible-ssh-%h-%p-%r 
# 
# A quick fix is to set directory of control path. 
#
# It also can set ssh_args to empty, so that control_path will not be used
#
#
RUN sed -i '/#control_path/ a control_path = /tmp/ansible-ssh' /etc/ansible/ansible.cfg

RUN echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale

RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa \
  && cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys \
  && sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config \
  && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
  && echo "UsePAM no" >> /etc/ssh/sshd_config \
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

RUN useradd -ms /bin/bash -p user user \
	&& useradd -ms /bin/bash -p test test

USER user

RUN ssh-keygen -q -N "" -t rsa -f /home/user/.ssh/id_rsa \
    && cp /home/user/.ssh/id_rsa.pub /home/user/.ssh/authorized_keys 

USER test

RUN ssh-keygen -q -N "" -t rsa -f /home/test/.ssh/id_rsa \
    && cp /home/test/.ssh/id_rsa.pub /home/test/.ssh/authorized_keys 

USER root

CMD ["/usr/sbin/sshd", "-D"]