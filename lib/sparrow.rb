require "sparrow/version"

module Sparrow
  class Connection
    DEFAULTS={
      :env_mkey_name=>'SPARROW_MKEY', 
      :api_endpoint=>'https://secure.sparrowone.com/Payments/Services_api.aspx', 
      :timeout=>30,
      :mkey=>nil
    }

    attr_accessor :config
    
    def initialize(**options)
      @config = {}
      DEFAULTS.each do |k,v|
        @config[k] = options.has_key?(k) ? options[k] : v
      end
      if(!@config[:mkey])
        if(ENV.has_key?(@config[:env_mkey_name]))
          @config[:mkey] = ENV[@config[:env_mkey_name]].dup
        end
      end
      if(!@config[:mkey] or !@config[:mkey].is_a? String)
        raise ConnectionError.new("Invalid mkey")
      end
      @config[:mkey].strip!
      if(@config[:mkey].length==0)
        raise ConnectionError.new("Invalid mkey")
      end
    end
  end
  
  class ConnectionError < StandardError
  end
end
