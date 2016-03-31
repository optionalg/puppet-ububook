class cron_puppet {
    file { 'post-hook':
        ensure => file,
        path   => '/etc/puppet/.git/hooks/post-merge',
        source => 'puppet:///modules/cron_puppet/post-merge',
        mode   => '0755',
        owner  => 'root',
        group  => 'root',
    }
    file { 'puppet-logrotate':
        ensure => file,
        path   => '/etc/logrotate.d/puppet',
        source => 'puppet:///modules/cron_puppet/puppet.logrotate',
        mode   => '0644',
        owner  => 'root',
        group  => 'root',
    }
    cron { 'git-pull':
        ensure  => present,
        command => 'cd /etc/puppet ; /usr/bin/git pull',
        user    => 'root',
        minute  => '*/20',
        require => File['post-hook'],
    }
    cron { 'puppet-apply':
        ensure  => present,
        command => '/etc/puppet/.git/hooks/post-merge',
        user    => 'root',
        minute  => '55',
        require => File['post-hook'],
    }
    cron { 'puppet-apply-reboot':
        ensure  => present,
        command => '/etc/puppet/.git/hooks/post-merge',
        user    => 'root',
        special => 'reboot',
        require => File['post-hook'],
    }
}
