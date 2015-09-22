# Development environment
# 3E Enterprises, LLC

class dev_base {
  # Install packer
  class {'packer':
    version => '0.8.6',
  }
  
  # Install docker
  class {'docker':
    docker_users => ['vagrant'],
    version      => '1.7.1',
  }

  # Install apt-get packages.  These are typically version controlled by the
  # package manager.
  Package {ensure => installed}
  
  $packages = [
    # DVCSs
    'git',
    'mercurial',

    # Editor
    'vim',
  ]

  package {$packages:}

  # Install gem packages.
  package {'puppet-lint':
    ensure   => '1.1.0',
    provider => gem,
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
}