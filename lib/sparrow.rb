require "sparrow/version"

module Sparrow
  class Connection
    ENV_MKEY_NAME='SPARROW_MKEY';

    attr_accessor :mkey
    
    def initialize(mkey: nil)
      if(!mkey)
        if(ENV.has_key?(ENV_MKEY_NAME))
          mkey = ENV[ENV_MKEY_NAME].dup
        end
      end
      if(!mkey or !mkey.is_a? String)
        raise ConnectionError.new("Invalid mkey")
      end
      mkey.strip!
      if(mkey.length==0)
        raise ConnectionError.new("Invalid mkey")
      end
      @mkey = mkey
    end
  end
  
  class ConnectionError < StandardError
  end
end
