# -*- mode: ruby -*-
# vi: set ft=ruby :
# Avoid having to pass --provider=docker

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
VAGRANT_ROOT = File.dirname(__FILE__)

Vagrant.configure("2") do |config|

  config.vm.define "mysql" do |mysql|
    mysql.vm.provider "docker" do |d|
      d.name = "my-mysql"
      d.build_dir = "docker/mysql"
      d.create_args = ["-e", "MYSQL_ROOT_PASSWORD=root", "-e", "MYSQL_DATABASE=redmine", "-e", "MYSQL_USER=redmine", "-e", "MYSQL_PASSWORD=redmine"]
    end
  end

  config.vm.define "rails" do |rails|
    rails.vm.synced_folder ".", "/home/redmine/src"
    rails.vm.provider "docker" do |d|
      d.build_dir = "docker/rails"
      d.name = "redmine"
      d.remains_running = true
      d.ports = ["3000:3000"]
      d.volumes = ["#{VAGRANT_ROOT}:/home/redmine/src"]
      #d.link "my-mysql:mysql"
      d.create_args = ["--link", "my-mysql:mysql"]
    end
  end

end
