
class djbdns::zonedata (
  $recordtype,
  $dnsname,
  $ip,
  $ttl,
){

    include djbdns::params
        tinydns_record { $dnsname:
                          recordtype => $recordtype,
                          ip         => $ip,
                          ttl        => $ttl,
        }
}

define djbdns::zone_record($dnsname, $recordtype, $ip, $ttl) {
  tinydns_record { $dnsname:
            recordtype => $recordtype,
            ip         => $ip,
            ttl        => $ttl,
          }

}
