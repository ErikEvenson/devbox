# Installs mongodb
# 2014 3E Enterprises, LLC

class mongodb::services {
  require mongodb::configure

  service {
    'mongod':
      ensure => running,
      enable => true;
  }
}
