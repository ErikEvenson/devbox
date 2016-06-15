#!/bin/bash
#
# 2012-2016 3E Enterprises, LLC

lint()
{
  echo "Linting..."
  puppet-lint /vagrant/puppet/manifests
  puppet-lint /vagrant/puppet/local_modules
  return
}
