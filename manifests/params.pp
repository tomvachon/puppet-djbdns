class djbdns::params {

  case $::operatingsystem {
    'ubuntu': { 
      $service_dir = '/etc/service'
      $zone_file = '/etc/tinydns/root/data'
    }
    default: { fail 'only ubuntu is supported at this time' }
  }

}
