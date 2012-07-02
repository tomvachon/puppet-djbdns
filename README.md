puppet-djbdns
=============

Description: Puppet module for installing djbdns


Overview
-------------

This puppet module is designed **ONLY** for Ubuntu at this time (due to package availability in repositories).

This module will install and configure both DNSCache and TinyDNS (the two portions of the DJBDNS suite).

Todo
-------------

Custom Provider and Type are current underwork.  Pull requests are welcome.  As it stands exists? is called, but not create or destroy.

Usage
-------------

To install the DJBDNS suite
`include djbdns`

This will leave a installed, but nearly unfunctional system (it will only listen for requests on localhost, which is impossible with both on the same system.

To setup the listen nets:

    class { 'djbdns::dnscache':
      listen_net => 'Some.IP.Range.Here',
    }
    
Note that the listen_net can be as short as a single octet and you can have multiple.

To set the TinyDNS authoritative link from DNS cache do the following

    class { 'djbdns::zone':
      zone_names => ['foo.com', 'bar.com'],
    }

Again, you can have an array in this place to delegate authority to TinyDNS for multiple domains.


License
-------------

This module is made available under the Apache 2.0 License and all its terms and conditions.  It is provided free of charge and with no warranty.



