#### Table of contents
1. [Name](#name)
2. [Synopsis](#synopsis)
    * [Installing modules](#installing-modules)
    * [Listing installed modules](#listing-installed-modules)
    * [Applying the configuration by hand](#applying-the-configuration-by-hand)
3. [Description](#description)
    * [Step by step](#step-by-step)
4. [References](#references)
5. [License](#license)
6. [Author](#author)

# NAME

Puppet masterless / nodeless module package

# SYNOPSIS

## Installing modules

In the work directory:

`puppet module install --target-dir /etc/puppet/modules puppetlabs-apt`

## Listing installed modules

In the work directory:

`puppet module list --modulepath /etc/puppet/modules`

## Applying the configuration by hand

As root or with sudo:

`puppet apply /etc/puppet/manifests/site.pp`

or alternatively with the `post-merge` script:

`/etc/puppet/.git/hooks/post-merge`

# DESCRIPTION

This is a general masterless Puppet configuration
including some modules to automate in small, medium, big
and very flexible environments.

The DevOps person can maintain the system from a remote computer,
the Puppet Master is a Git repo now. If there is any change/new, then
Git will pick that up with a cron job, and it triggers a Puppet run.

### Step by step:

* The cron job will run a `git pull` in a timely manner
* If there is something to pull, it triggers the `merge-hook`
* The `merge-hook` will run the `puppet apply` command
* Another cron job will run a `puppet apply` with the `merge-hook`
script to avoid configuration drifts if there is nothing to merge

It is a scalable, flexible solution without any server overhead,
there is not any running agents.

# REFERENCES

Masterless howto at DigitalOcean:
[Masterless Puppet @DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-masterless-puppet-environment-on-ubuntu-14-04)

Puppet:
[Puppet website](https://puppet.com)

# LICENSE

Author: Tamas Molnar

Copyright 2015, 2016, Tamas Molnar.

Licensed under the Apache License, Version 2.0 (the "License")

You may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing
permissions and limitations under the License.

# AUTHOR

Tamas Molnar <stiron@gmail.com>
