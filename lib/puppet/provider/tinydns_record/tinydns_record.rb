require 'fileutils'

Puppet::Type.type(:tinydns_record).provide(:tinydns_record) do 
  desc "Provides management of tinydns records via commands where possible"

  commands :tinydns_record    => '/usr/bin/make'
  
  
    def create
      datadir = '/etc/tinydns/root/'
      datafile = '/etc/tinydns/root/data'
      record_symbol = human_to_tinydns_format(resource[:recordtype])
      
      if exists?(resource[:name]) != nil
        raise ArgumentError, "%$s is already defined and cannot be redefined" % value
      end
      line="#{record_symbol}:#{resource[:name]}:#{resource[:ip]}:#{resource[:ttl]}"
    
      File.open(datafile, 'a') { |f| f.puts line }
      chdir datadir
      make
    end

    def destroy
      datadir = '/etc/tinydns/root/'
      datafile = '/etc/tinydns/root/data'
    
      record_symbol = human_to_tinydns_format(resource[:recordtype])
      line="#{record_symbol}:#{resource[:name]}:#{resource[:ip]}:#{resource[:ttl]}"
      lines_arr = File.readlines(datafile)
      line_escaped = line.gsub!(/\./, '\.')
      lines_arr.delete_if { |i| i =~ /line_escaped/ }
      File.open(datafile, "w") do |f|
          line_arr.each{|line| f.puts(line)}
      end
      chdir datadir
      make
    end

    def exists?
      datadir = '/etc/tinydns/root/'
      datafile = '/etc/tinydns/root/data'
      record_symbol = human_to_tinydns_format(resource[:recordtype])
      record_exists = false
      
      File.open(datafile) { |f|
        record_exists = true if f.include? resource[:name]
      }
      
      record_exists

    end

    def human_to_tinydns_format(recordtype) 
      record_format = {
        :ns => '.',
        :childns => '&',
        :host => '=',
        :alias => '+',
        :mx => '@',
        :text => "'",
        :ptr => '^'
      }

      record_format[recordtype]
    end

end
