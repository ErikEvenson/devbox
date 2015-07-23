#!/bin/bash
#
# 2012-2015 3E Enterprises, LLC

papply()
{
  echo "Puppet apply..."

  /opt/puppetlabs/bin/puppet apply puppet/environments/development/manifests/nodes/base.pp \
    --environment="development" \
    --environmentpath="puppet/environments" \
    --hiera_config="puppet/environments/development/hiera.yaml" \
    $*

  return
}
