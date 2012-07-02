class djbdns::zone(
  $zone_names,
){

    include djbdns::params
    $zone_file = $djbdns::params::zone_file

    djbdns::zone_file { $zone_names: }
}

define djbdns::zone_file() {
  file { "/etc/dnscache/root/servers/${name}":
    content => '127.0.0.1',
    require => Package['dnscache-run'],
  }
}
