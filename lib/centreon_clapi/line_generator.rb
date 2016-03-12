module CentreonClapi
  module LineGenerator
    def self.included(klass)
      klass.class_exec do
        define_method :render do |key, values = {}|
          return unless klass::LINES.key?(key)
          msg = klass::LINES[key]
          values.each do |k, v|
            msg.gsub!(Regexp.new('\{\{' + k.to_s + '\}\}'), v.to_s)
          end
          msg
        end
        private :render
      end
    end
  end
end
