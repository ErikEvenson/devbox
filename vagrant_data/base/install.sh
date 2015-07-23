#!/usr/bin/env bash
#
# This bootstraps Puppet.
# Adapted from:
# https://github.com/hashicorp/puppet-bootstrap
#
# 2012-2015 3E Enterprises, LLC

set -e

# Load up the release information
. /etc/lsb-release

REPO_DEB_URL="https://apt.puppetlabs.com/puppetlabs-release-pc1-${DISTRIB_CODENAME}.deb"

#--------------------------------------------------------------------
# NO TUNABLES BELOW THIS POINT
#--------------------------------------------------------------------
if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null 2>&1 -a apt-cache policy | grep --quiet apt.puppetlabs.com; then
  echo "Puppet is already installed."
  exit 0
fi

# Do the initial apt-get update
echo "Initial apt-get update..."
apt-get update >/dev/null

# Install wget if we have to (some older Ubuntu versions)
echo "Installing wget..."
apt-get install -y wget >/dev/null

# Install the PuppetLabs repo
echo "Configuring PuppetLabs repo..."
repo_deb_path=$(mktemp)
wget --output-document="${repo_deb_path}" "${REPO_DEB_URL}" 2>/dev/null
dpkg -i "${repo_deb_path}" >/dev/null
apt-get update >/dev/null

# Install Puppet
echo "Installing Puppet..."
echo $(ls)
apt-get install -y puppet-agent=1.2.2-1trusty
echo "PATH=$PATH:/opt/puppetlabs/bin" > /etc/profile.d/puppetlabs.sh
echo "Puppet installed!"

# # Install RubyGems for the provider
# echo "Installing RubyGems..."
# if [ $DISTRIB_CODENAME != "trusty" ]; then
#   apt-get install -y rubygems >/dev/null
# fi

# # Use something like this in case of DDOS attacks on rubygems.org:
# # gem sources --add http://54.186.104.15

# gem install --no-ri --no-rdoc rubygems-update
# update_rubygems >/dev/null
