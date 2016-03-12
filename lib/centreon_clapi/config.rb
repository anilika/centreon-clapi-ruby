
require 'toml'
module CentreonClapi
  class Config
    FIELDS = %w(centreon_user centreon_pass).freeze
    attr_accessor(*FIELDS)
    def add_config(config_path)
      @config_path = config_path
      set_variable(config_path) if File.exist?(config_path)
    end

    def set_variable(config_path)
      TOML.load_file(config_path).each do |table, data|
        data.each do |k, v|
          var_name = '@' + [table.to_s, k.to_s].join('_')
          instance_variable_set(var_name, v) if FIELDS.include?(var_name)
        end
      end
    end
  end
end
