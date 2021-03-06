#!/usr/bin/env bash

# Installing Puppet on the system
wget -O /tmp/puppetlabs.deb http://apt.puppetlabs.com/puppetlabs-release-`lsb_release -cs`.deb
dpkg -i /tmp/puppetlabs.deb
apt-get -q -y update
apt-get -q -y install git-core puppet

# Moving the old Puppet directory to a backup
mv /etc/puppet /etc/puppet-`date +%Y-%m-%d`

# Cloning the ububook repo to /etc/puppet
git clone https://github.com/stiron/puppet-ububook.git /etc/puppet
