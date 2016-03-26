#!/usr/bin/env ruby

require 'yaml'

if ARGV.empty?
  abort('Missing parameter')
end

fqdn = ARGV[0]
enc_conf = "/etc/puppet/#{fqdn}.yaml"
data = YAML.load_file(enc_conf)
ret = {}

# Is there such key?
if data.has_key?('environment')
  ret['environment'] = data['environment']
else
  ret['environment'] = 'production' # We use the Puppet default
end
                                                                                                                                       
puts ret.to_yaml
