# redmine-docker-provider
Redmine docker image based on alrf/ubuntu-rvm-rails docker image (https://github.com/alrf/docker-ubuntu-rvm-rails).  

Build image as:  
clone this repo  
run `vagrant up`  

Run as:  
docker run -dit -v /home/docker_provider/redmine:/home/redmine/src -p 3000:3000 f41146a3e7a3  
where:  
/home/docker_provider/redmine - host-based directory, which contains the Redmine sources.  
/home/redmine/src - container directory, which will be contain the Redmine sources from host.  
f41146a3e7a3 - image id  (builded on vagrant up)  
