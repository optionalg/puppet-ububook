#!/usr/bin/env bash

# Install Git and Puppet
wget -O /tmp/puppetlabs.deb http://apt.puppetlabs.com/puppetlabs-release-`lsb_release -cs`.deb
dpkg -i /tmp/puppetlabs.deb
apt-get -q -y update
apt-get -q -y install git-core puppet

if [[ -d /etc/puppet ]]; then
  # Backup the puppet directory if exists
  mv puppet/ puppet-backup
else
  # Clone the 'puppet-ububook' repo
  git clone https://github.com/stiron/puppet-ububook.git /etc/puppet

  # Run Puppet initially to set up the auto-deploy mechanism
  puppet apply /etc/puppet/manifests/site.pp
fi
