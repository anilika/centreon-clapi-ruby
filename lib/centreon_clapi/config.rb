
require 'toml'

module CentreonClapi
  class Config
    FIELDS = %w(centreon_user centreon_pass file_link).freeze
    attr_accessor(*FIELDS)
    def initialize(config_path)
      @config_path = config_path
      puts "kikiki"
      if File.exist?(config_path)
        set_variable(config_path)
      else
        puts 'No config file found'
      end
    end

    def set_variable(config_path)
      puts "ololo"
      TOML.load_file(config_path).each do |table, data|
        data.each do |k, v|
          var_name = [table.to_s, k.to_s].join('_')
          instance_variable_set('@' + var_name, v) if FIELDS.include?(var_name)
        end
      end
    end
  end
end
