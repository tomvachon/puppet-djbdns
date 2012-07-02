class djbdns::tinydns {

  include djbdns::params

  exec{'tinydns-conf':
    command => '/usr/bin/tinydns-conf Gtinydns Gdnslog /etc/tinydns 127.0.0.1',
    user    => root,
    creates => '/etc/tinydns/run',
    require => Package['djbdns'],
  }
  file{'tinydns-daemontools':
    ensure   => link,
    path     => "${djbdns::params::service_dir}/tinydns",
    target   => '/etc/tinydns',
    require  => Exec['tinydns-conf'],
  }

}
