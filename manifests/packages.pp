class djbdns::packages {

  package{'djbdns':
    ensure => installed,
  }
  package{'dnscache-run':
    ensure => installed,
  }
  package{'daemontools':
    ensure => installed,
  }
  service{'svscan':
    ensure  => running,
    enable  => true,
    require => Package['daemontools'],
  }
}
