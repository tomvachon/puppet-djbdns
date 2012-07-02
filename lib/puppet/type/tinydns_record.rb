Puppet::Type.newtype(:tinydns_record) do
  @doc = "Create a record in the tinydns system"
  
  ensurable
  
  autorequire(:package) do
    ["djbdns"]
  end
  
  newparam(:name, :namevar => true) do
    desc "DNS Record FQDN"
  end
  
  newparam(:recordtype) do
    desc "Type of DNS record"
    newvalues(:soa, :childns, :host, :alias, :mx, :text, :ptr)
  end
  
  newparam(:ip) do 
    desc 'IP address of the host'
    validate do |value|
      unless value =~ /^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/
        raise ArgumentError, "%s is not a valid ip" % value
      end
    end
  end

  newparam(:ttl) do
    desc "TTL of DNS entry"
    validate do |value|
      unless value =~ /^[0-9].+$/
        raise ArgumentError, "%s is not a valid ttl" % value
      end
    end
  end

end
