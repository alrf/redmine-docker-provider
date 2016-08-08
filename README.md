# redmine-docker-provider
Redmine docker image based on alrf/ubuntu-rvm-rails docker image (https://github.com/alrf/docker-ubuntu-rvm-rails).  

Build image as:  
clone this repo  
run `vagrant up`  

Run as:  
docker run -dit -v /home/docker_provider/redmine:/home/redmine/src -p 3000:3000 f41146a3e7a3  
where:  
/home/docker_provider/redmine - host-based directory, which contains the Redmine sources.  
Don't forget add the config/database.yml file.  
MySQL user and database for Redmine will be created automatically based on config/database.yml file.  
/home/redmine/src - container directory, which will be contain the Redmine sources from host.  
f41146a3e7a3 - image id  (builded on vagrant up)  

Step by step:  
cd /home/user1  
git clone https://github.com/alrf/redmine-docker-provider.git  
cd /home/user1/redmine-docker-provider  
git clone https://github.com/alrf/redmine.git  
Add the config/database.yml file into /home/user1/redmine-docker-provider/redmine/config directory  
vagrant up  
docker run -dit -v /home/user1/redmine-docker-provider/redmine:/home/redmine/src -p 3000:3000 \<image_id\>  
