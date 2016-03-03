#!/usr/bin/env bash

if [[ -d /etc/puppet ]]; then
  cd /etc/puppet
  git pull
else
  wget -O /tmp/puppetlabs.deb http://apt.puppetlabs.com/puppetlabs-release-`lsb_release -cs`.deb
  dpkg -i /tmp/puppetlabs.deb
  apt-get -q -y update
  apt-get -q -y install git-core puppet
  git clone https://github.com/stiron/puppet-ububook.git /etc/puppet
fi
