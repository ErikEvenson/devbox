# Technology stack

These are the technologies used in this project.

## apt-get-installed

- [git](http://packages.ubuntu.com/trusty/git) 1.9.1 [Changelog](https://github.com/git/git/tree/master/Documentation/RelNotes) - fast, scalable, distributed revision control system.
- [imagemagick](http://packages.ubuntu.com/trusty/imagemagick)
- [mercurial](http://packages.ubuntu.com/trusty/mercurial) 3.1 - easy-to-use, scalable distributed version control system.
- [openjdk-7-jdk](http://packages.ubuntu.com/trusty/openjdk-7-jdk) 7u79-2.5.5-0ubuntu0.14.04.2 - OpenJDK Development Kit (JDK).
- [vim](http://www.vim.org/) 2:7.4.052-1ubuntu3 - Vim is an advanced text editor that seeks to provide the power of the de-facto Unix editor 'Vi', with a more complete feature set. It's useful whether you're already using vi or using a different editor.
- [xfonts-100dpi](http://packages.ubuntu.com/trusty/xfonts-100dpi)
- [xfonts-75dpi](http://packages.ubuntu.com/trusty/xfonts-75dpi)
- [xfonts-scalable](http://packages.ubuntu.com/trusty/xfonts-scalable)
- [xfonts-cyrillic](http://packages.ubuntu.com/trusty/xfonts-cyrillic)
- [xvfb](http://packages.ubuntu.com/trusty/xvfb)

## bash-installed

- [mongoDB](http://www.mongodb.org/) 3.0.3 - The only database that harnesses the innovations of NoSQL (flexibility, scalability, performance) and builds on the foundation of relational databases (expressive query language, secondary indexes, strong consistency).
- [node](https://nodejs.org/) 0.12.4 - A platform built on Chrome's JavaScript runtime for easily building fast, scalable network applications.
- [puppet](http://puppetlabs.com/) 3.7.5 - Open source Puppet is a flexible, customizable framework available under the Apache 2.0 license designed to help system administrators automate the many repetitive tasks they regularly perform.

## gem-installed

- [puppet-lint](http://puppet-lint.com/) 1.1.0 - Check that your Puppet manifest conform to the style guide.

## npm-installed (global)

- [gulp](https://www.npmjs.com/package/gulp) 3.8.11 - The streaming build system
- [npm](https://npmjs.org/doc/) 2.10.1 - node package manager
* [npm-check-updates](https://www.npmjs.org/package/npm-check-updates) 1.5.1 - Find newer versions of dependencies than what your package.json allows.
- [protractor](https://www.npmjs.com/package/protractor) 2.1.0 - Webdriver E2E test wrapper for Angular.

## Installed on host

These tools are installed directly on the host.  On a Mac, they are can be installed easily using [homebrew](http://brew.sh/) and [homebrew cask](http://caskroom.io/).

***Check for updates manually.***

- [Vagrant](https://www.vagrantup.com/) 1.7.2 [Change log](https://github.com/mitchellh/vagrant/blob/master/CHANGELOG.md) [Fork](https://github.com/EATechnologies/vagrant) - used to manage development environment configuration.
- [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier/) 1.2.0 - A Vagrant plugin that helps you reduce the amount of coffee you drink while waiting for boxes to be provisioned by sharing a common package cache among similiar VM instances.
- [vagrant-librarian-puppet](https://github.com/mhahn/vagrant-librarian-puppet) 0.9.0 - A Vagrant plugin to install Puppet modules using Librarian-Puppet.
- [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) 0.10.0 [Changelog[(https://github.com/dotless-de/vagrant-vbguest/blob/master/CHANGELOG.md) [Fork](https://github.com/EATechnologies/vagrant-vbguest) - automatically keeps VirtualBox Guest Additions up to date.  ***Updates are manual.***
- [VirtualBox](https://www.virtualbox.org/) 4.3.28 - used to host development environment.

## Puppet modules

- [garethr/heroku](https://forge.puppetlabs.com/garethr/heroku) 0.0.1 - Module to install the heroku toolbelt.
- [jamesnetherton/google_chrome](https://forge.puppetlabs.com/jamesnetherton/google_chrome) 0.1.0 - Installs the Google Chrome web browser
- [puppetlabs-apt](https://forge.puppetlabs.com/puppetlabs/apt) 1.8.0 - The APT module provides a simple interface for managing APT source, key, and definitions with Puppet.
- [puppetlabs-stdlib](https://forge.puppetlabs.com/puppetlabs/stdlib) 4.6.0 - This module provides a "standard library" of resources for developing Puppet Modules.
- [willdurand/nodejs](https://forge.puppetlabs.com/willdurand/nodejs) 1.8.5 - A module to install Node.js and NPM.

## Vagrant/vagrant-installed

- [ubuntu/trusty64](https://atlas.hashicorp.com/ubuntu/boxes/trusty64) 20150521.0.0