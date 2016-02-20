class virtualbox {

  exec { "wget-virtualbox-deb":
    command => "/usr/bin/wget -O /tmp/virtualbox.deb $vbox_url",
    unless => [ "test -d /etc/virtualbox", ],
  }

  exec { "install-virtualbox-deb":
    command => "/usr/bin/dpkg -i /tmp/virtualbox.deb",
    unless => [ "test -d /etc/virtualbox", ],
  }

}
