require "sparrow/version"

module Sparrow
  class Connection
    ENV_PREFIX="SPARROW_"
    DEFAULTS={
      :api_endpoint=>'https://secure.sparrowone.com/Payments/Services_api.aspx', 
      :timeout=>30,
      :mkey=>nil
    }

    attr_accessor :config
    
    def initialize(**options)
      @config = {}
      DEFAULTS.each do |k,v|
        ek = "#{ENV_PREFIX}#{k.to_s.upcase}"
        @config[k] = (options.has_key?(k) ? options[k] : (ENV.has_key?(ek) ? ENV[ek].dup : v ))
        if(@config[k].is_a? String) 
          @config[k].strip!
        end
      end
      @config[:timeout] = @config[:timeout].to_i
      
      if(!@config[:mkey] or !@config[:mkey].is_a? String or @config[:mkey].length==0)
        raise ConnectionError.new("Invalid mkey")
      end
    end
  end
  
  class ConnectionError < StandardError
  end
end
