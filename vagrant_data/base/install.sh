#!/usr/bin/env bash
#
# This bootstraps Puppet.
# Adapted from:
# https://github.com/hashicorp/puppet-bootstrap
#
# 2012-2016 3E Enterprises, LLC

set -e

# Load up the release information
. /etc/lsb-release

PUPPET_AGENT_VERSION="1.2.2-1trusty"
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
REPO_DEB_PATH=$(mktemp)
wget --output-document="${REPO_DEB_PATH}" "${REPO_DEB_URL}" 2>/dev/null
dpkg -i "${REPO_DEB_PATH}" >/dev/null
apt-get update >/dev/null

# Install Puppet
echo "Installing Puppet..."
apt-get install -y puppet-agent=${PUPPET_AGENT_VERSION}
echo "PATH=\$PATH:/opt/puppetlabs/bin" > /etc/profile.d/puppetlabs.sh
echo "Puppet installed!"
