class djbdns::dnscache (
$listen_nets,
){

  file {'/etc/dnscache/env/IP':
    content => $::ipaddress,
    require => File['iproot'],
  }
  djbdns::listen_nets { $listen_nets: }
  file{'iproot':
    path    => "/etc/dnscache/root/ip/${::ipaddress}",
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

define djbdns::listen_nets() {
  file { "/etc/dnscache/root/ip/${name}":
    ensure => 'present',
    notify => Service['dnscache'],
  }
}
