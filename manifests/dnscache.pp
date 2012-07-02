class djbdns::dnscache (
$listen_net
){

  file {'/etc/dnscache/env/IP':
    content => $::ipaddress,
    require => File['iproot'],
  }
  file {"dnscache-$listen_net":
    ensure => present,
    path   => "/etc/dnscache/root/ip/${listen_net}",
    notify => Service['dnscache'],
  }
  file{'iproot':
    path    => "/etc/dnscache/root/ip/$::ipaddress",
    owner   => root,
    mode    => '0600',
    notify  => Service['dnscache'],
    require => Package['djbdns'],
  }
  service{'dnscache':
    ensure   => running,
    provider => daemontools,
    require  => [File['iproot'], Package['daemontools']],
  }
  
}
