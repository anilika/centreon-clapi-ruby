
require 'byebug'
require 'centreon_clapi/version'
require 'centreon_clapi/config'
require 'centreon_clapi/host'
require 'centreon_clapi/line_generator'
require 'centreon_clapi/actions'

module CentreonClapi
  class Clapi
    
    attr_reader :actions, :config
    include Host
    include LineGenerator
    def initialize(config_file)
      @config = Config.new(config_file)
      @actions = Actions.new(config.centreon_user, config.centreon_pass, config.file_link)
    end
  end
  
  my_clapi = Clapi.new('lib/config.toml')
  puts my_clapi.config.centreon_pass
end
