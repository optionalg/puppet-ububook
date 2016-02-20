class virtualbox {

  exec { "wget-virtualbox-deb":
    command => "/usr/bin/wget -O /tmp/virtualbox.deb $vbox_url",
    unless => "/usr/bin/dpkg -l virtualbox*",
  }

  exec { "install-virtualbox-deb":
    command => "/usr/bin/dpkg -i /tmp/virtualbox.deb",
    unless => "/usr/bin/dpkg -l virtualbox*",
  }

}
