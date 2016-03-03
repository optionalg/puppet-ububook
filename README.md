# NAME

Puppet masterless solution

# SYNOPSYS

## Installing modules

In the work directory:

`puppet module install --target-dir ./modules puppetlabs-apt`

## Listing installed modules

In the work directory

`puppet module list --modulepath ./modules`

## Applying the configuration (just for experimenting)

As root or with sudo:

`puppet apply /etc/puppet/manifests/site.pp`

# DESCRIPTION

This is an ordinary masterless Puppet configuration
included with modules to automate in relatively small
environments (I personally use it at home).

It is based on DigitalOcean's howto, and this way a lot
of thanks to the guys there.

The DevOps person can maintain the system from a personal notebook,
the Puppet Master is GIT for now. If there is anything new, then
GIT will pick it up due to a cron job, and it triggers a Puppet run.

### Step by step:

* The cron job will run a `git pull` in a timely manner
* If there is something to pull, it triggers the `merge-hook`
* The `merge-hook` will run the `puppet apply` command
* Another cron job will run a `puppet apply` with the `merge-hook`
script to avoid configuration drifts

It is a scalable solution without unnecessary overhead,
but if there is any better solution, please do not
hesitate to contact me.

Thank you!

# REFERENCES

Original howto at DigitalOcean:
[Masterless Puppet @DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-masterless-puppet-environment-on-ubuntu-14-04)

PuppetLabs:
[PuppetLabs website](https://puppetlabs.com/)

# MAINTAINED BY

Tamas Molnar <stiron@gmail.com>
