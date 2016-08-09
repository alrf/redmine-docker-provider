FROM alrf/ubuntu-rvm-rails

#RUN echo 'mysql-server mysql-server/root_password password root' | sudo debconf-set-selections
#RUN echo 'mysql-server mysql-server/root_password_again password root' | sudo debconf-set-selections
#RUN apt -y install mysql-server libmysqlclient-dev && update-rc.d mysql defaults && update-rc.d mysql enable && service mysql start

RUN useradd -d /home/redmine -m -s /bin/bash redmine
RUN adduser redmine sudo
RUN echo 'redmine ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/redmine

USER redmine

RUN mkdir /home/redmine/src

USER root

VOLUME /home/redmine/src

COPY docker-entrypoint.sh /
RUN /bin/chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3000
