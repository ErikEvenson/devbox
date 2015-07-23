# Installs development base.
# 2012-2015 Van Brunt and Associates and 3E Enterprises, LLC

class dev_base {
  # Install google chrome
  include 'google_chrome'

  # Install heroku client
  include 'heroku'

  file {'heroku.sh':
    path   => '/etc/profile.d/heroku.sh',
    source => 'puppet:///modules/dev_base/heroku.sh',
  }

  # Install nodejs.
  class { 'nodejs':
    version    => 'v0.12.7',
  }

  # Add node path
  file {'nodejs_path.sh':
    path   => '/etc/profile.d/nodejs_path.sh',
    source => 'puppet:///modules/dev_base/nodejs_path.sh',
  }
  
  #require mongodb

  # Install apt-get packages.  These are typically version controlled by the
  # package manager.
  Package {ensure => installed}
  
  $packages = [
    # DVCSs
    'git',
    'mercurial',

    # Editor
    'vim',

    # Selenium/protractor support
    'openjdk-7-jdk',

    # xvfb support
    # inspired by
    # http://www.ramandv.com/blog/angularjs-protractor-selenium-headless-end-end-testing
    'xfonts-100dpi',
    'xfonts-75dpi',
    'xfonts-scalable',
    'xfonts-cyrillic',
    'xvfb',
    'imagemagick',

    # pandoc support
    'pandoc',
    'texlive',

    # docker support
    'docker.io'
  ]

  package {$packages:}

  # Install gem packages.
  package {'puppet-lint':
    ensure   => '1.1.0',
    provider => gem,
  }

  # Install global npm packages.  Update npm last.
  package { 'bower':
    ensure   => '1.4.1',
    notify   => Package['npm'],
    provider => 'npm',
    require  => Class['nodejs'],
  }

  package { 'gulp':
    ensure   => '3.8.11',
    notify   => Package['npm'],
    provider => 'npm',
    require  => Class['nodejs'],
  }

  package { 'karma-cli':
    ensure   => '0.0.4',
    notify   => Package['npm'],
    provider => 'npm',
    require  => Class['nodejs'],
  }

  package { 'npm':
    ensure   => '2.10.1',
    provider => 'npm',
    require  => Class['nodejs'],
  }

  package { 'npm-check-updates':
    ensure   => '1.5.1',
    notify   => Package['npm'],
    provider => 'npm',
    require  => Class['nodejs'],
  }

  package { 'protractor':
    ensure   => '2.1.0',
    notify   => Package['npm'],
    provider => 'npm',
    require  => Class['nodejs'],
  }

  # Set vim as editor.
  exec { '/usr/bin/update-alternatives --set editor /usr/bin/vim.basic':
    require => Package['vim'],
    unless  => '/usr/bin/test /etc/alternatives/editor -ef /usr/bin/vim.basic',
  }

  # Set working directory.
  file_line {'cd_vagrant':
    path => '/home/vagrant/.bashrc',
    line => 'cd /vagrant',
  }

  # Allow vagrant user to global install npm packages
  exec { 'chown node directory':
    command => '/bin/chown -R vagrant:vagrant /usr/local/node/',
    path    => '/bin',
    require => Package['npm'],
    user    => 'root',
  }

  # Set up Protractor/Selenium
  exec { 'webdriver-manager update':
    command => '/usr/local/node/node-default/bin/webdriver-manager update',
    path    => ['/bin', '/usr/local/node/node-default/bin'],
    require => Package['protractor'],
    user    => 'root',
  }
}