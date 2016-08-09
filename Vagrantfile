# -*- mode: ruby -*-
# vi: set ft=ruby :
# Avoid having to pass --provider=docker

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
ENV['VAGRANT_NO_PARALLEL'] = "1"
VAGRANT_ROOT = File.dirname(__FILE__)

Vagrant.configure("2") do |config|

  config.vm.define "mysql" do |mysql|
    mysql.vm.provider "docker" do |d|
      d.name = "my-mysql"
      d.build_dir = "docker/mysql"
      d.has_ssh = true
    end
  end



  config.vm.define "rvm" do |a|
    a.vm.synced_folder ".", "/home/redmine/src"
    # Tell Vagrant to use Docker
    a.vm.provider "docker" do |d|
      d.build_dir = "docker"
      d.name = "redmine"
      d.remains_running = true
      d.ports = ["3000:3000"]
      d.volumes = [ "#{VAGRANT_ROOT}:/home/redmine/src" ]
      d.has_ssh = true
      d.link "my-mysql:mysql"
    end
  end
#  config.vm.synced_folder ".", "/home/redmine/src"

end
