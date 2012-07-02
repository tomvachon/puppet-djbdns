include djbdns
class { 'djbdns::dnscache':
  listen_net => '10',
}
class { 'djbdns::zone':
  zone_names => ['foo.com', 'bar.com'],
}

#Not Working
#class { 'djbdns::zonedata':
#  recordtype => soa,
#  dnsname    => 'a.foo.com',
#  ip         => '127.0.1.1',
#  ttl        => 300,
#}
