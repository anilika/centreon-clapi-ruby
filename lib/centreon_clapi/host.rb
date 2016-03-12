module CentreonClapi
  class Host
    include LineGenerator
    LINES = {
      add: './centreon -u admin -p centreon -o HOST -a ADD -v "{{name}};{{host_alias}};{{host_ip}};{{templates}};{{poller}};{{hostgroup}}"',
      add_f: 'HOST;ADD;{{name}};{{host_alias}};{{host_ip}};{{templates}};{{poller}};{{hostgroup}}'
    }.freeze
    def self.add(_name, _host_alias, _host_ip, _templates, _poller, _hostgroup)
    end
  end
end
