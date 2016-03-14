module CentreonClapi
  class Actions
    attr_reader :centreon_user, :centreon_pass, :file
    
    def initialize(centreon_user, centreon_pass, file)
      @centreon_user = centreon_user
      @centreon_pass = centreon_pass
      @file_link = file_link
    end
      
    def add_to_file(line)
      file = File.new(file.to_s, "a")
      file.write(line)
    rescue StandardError => e
      warn e.message
    ensure
      file.close
    end

    def exec(line)
      system("centreon_bin -u centreon_user -p centreon_pass -v \"#{line}\"")
    end
  end
end
