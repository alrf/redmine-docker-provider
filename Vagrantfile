# -*- mode: ruby -*-
# vi: set ft=ruby :
# Avoid having to pass --provider=docker

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

Vagrant.configure("2") do |config|

  # Start Provision
    config.vm.define "rvm" do |a|
      # Tell Vagrant to use Docker
      a.vm.provider "docker" do |d|
        d.build_dir = "docker"
        d.name = "redmine"
        d.remains_running = true
	d.ports = ["3000:3000"]
        d.volumes = ["/home/genesys/redmine-docker-provider:/home/redmine/src"]
      end
    end
end
