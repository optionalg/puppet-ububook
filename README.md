# NAME

Puppet Masterless

# SYNOPSYS

## Installing modules

In the work directory:

`puppet module install --target-dir ./modules puppetlabs-apt`

## Listing installed modules

In the work directory:

`puppet module list --modulepath ./modules`

## Applying the configuration (just for experimenting)

As root or with sudo:

`puppet apply /etc/puppet/manifests/site.pp`

or alternatively with the `post-merge` script:

`/etc/puppet/.git/hooks/post-merge`

# DESCRIPTION

This is a general masterless Puppet configuration
including some modules to automate in relatively small
and flexible environments.

The DevOps person can maintain the system from a remote computer,
the Puppet Master is a Git repo now. If there is any change/new, then
Git will pick that up with a cron job, and it triggers a Puppet run.

### Step by step:

* The cron job will run a `git pull` in a timely manner
* If there is something to pull, it triggers the `merge-hook`
* The `merge-hook` will run the `puppet apply` command
* Another cron job will run a `puppet apply` with the `merge-hook`
script to avoid configuration drifts

It is a scalable solution without any overhead,
but if there is any better solution, do not
hesitate to contact me.

Thank you!

# REFERENCES

Original howto at DigitalOcean:
[Masterless Puppet @DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-masterless-puppet-environment-on-ubuntu-14-04)

PuppetLabs:
[PuppetLabs website](https://puppetlabs.com/)

# MAINTAINED BY

Tamas Molnar - <stiron@gmail.com>
