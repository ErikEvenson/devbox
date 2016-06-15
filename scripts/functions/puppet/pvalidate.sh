#!/bin/bash
#
# 2012-2016 3E Enterprises, LLC

pvalidate()
{
  echo "Puppet validate..."
  puppet parser validate /vagrant/puppet/manifests/nodes/base.pp
  return
}
