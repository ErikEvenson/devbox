# Technology stack
These are the technologies used in this project.

## apt-get-installed
- [git](http://packages.ubuntu.com/trusty/git) 1:1.9.1-1ubuntu0.1 [Changelog](https://github.com/git/git/tree/master/Documentation/RelNotes) - fast, scalable, distributed revision control system.
- [mercurial](http://packages.ubuntu.com/trusty/mercurial) 2.8.2-1ubuntu1.3 - easy-to-use, scalable distributed version control system.
- [puppet-agent](http://puppetlabs.com/) 1.2.2-1trusty - Open source Puppet is a flexible, customizable framework available under the Apache 2.0 license designed to help system administrators automate the many repetitive tasks they regularly perform.
- [vim](http://www.vim.org/) 2:7.4.052-1ubuntu3 - Vim is an advanced text editor that seeks to provide the power of the de-facto Unix editor 'Vi', with a more complete feature set. It's useful whether you're already using vi or using a different editor.

## bash-installed
## gem-installed
- [puppet-lint](http://puppet-lint.com/) 1.1.0 - Check that your Puppet manifest conform to the style guide.

## Installed on host
These tools are installed directly on the host.  On a Mac, they are can be installed easily using [homebrew](http://brew.sh/) and [homebrew cask](http://caskroom.io/).

**_Check for updates manually._**
- [Vagrant](https://www.vagrantup.com/) 1.8.4 [Change log](https://github.com/mitchellh/vagrant/blob/master/CHANGELOG.md) - used to manage development environment configuration.
- [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier/) 1.2.1 - A Vagrant plugin that helps you reduce the amount of coffee you drink while waiting for boxes to be provisioned by sharing a common package cache among similiar VM instances.
- [vagrant-librarian-puppet](https://github.com/mhahn/vagrant-librarian-puppet) 0.9.2 - A Vagrant plugin to install Puppet modules using Librarian-Puppet.
- [vagrant-puppet-install](https://github.com/petems/vagrant-puppet-install) 2.0.0 - A Vagrant plugin that ensures the desired version of Puppet is installed via the Puppet Labs package repo.
- [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) 0.11.0 [Changelog[([https://github.com/dotless-de/vagrant-vbguest/blob/master/CHANGELOG.md](https://github.com/dotless-de/vagrant-vbguest/blob/master/CHANGELOG.md)) [Fork](https://github.com/EATechnologies/vagrant-vbguest) - automatically keeps VirtualBox Guest Additions up to date.  **_Updates are manual._**
- [VirtualBox](https://www.virtualbox.org/) 5.0.20 - used to host development environment.

## Puppet modules/installed by puppet modules
- [counsyl/packer](https://forge.puppetlabs.com/counsyl/packer) 0.9.18 - Puppet module for installing Packer, the modern automated machine image creation tool.
- [docker](https://www.docker.com/) 1.9.1 - Linux container runtime.
- [garethr/docker](https://forge.puppetlabs.com/garethr/docker) 4.1.1 - Module for installing and managing docker.
- [packer](https://www.packer.io) 0.10.1 - a tool for creating machine and container images for multiple platforms from a single source configuration.
- [puppetlabs-apt](https://forge.puppetlabs.com/puppetlabs/apt) 2.2.1 - The APT module provides a simple interface for managing APT source, key, and definitions with Puppet.
- [puppetlabs-stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib) 4.9.1 - This module provides a "standard library" of resources for developing Puppet Modules.

## Vagrant/vagrant-installed
- [ubuntu/trusty64](https://atlas.hashicorp.com/ubuntu/boxes/trusty64) 20151203.2.0
