require "sparrow/version"
require 'rest-client'
require 'date'

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
    
    def simple_sale(amount, card_info)
      args = {mkey: @config[:mkey], transtype: 'sale', amount: amount};
      args.merge!(card_info.to_hash)
      res = RestClient.post @config[:api_endpoint], args
      if(res.code != 200)
        raise ConnectionError.new("Sparrow API is not responding properly.")
      end
      parsed = CGI::parse(res.body)
      params = {}
      parsed.each do |k,v|
        params[k.to_sym] = v[0]
      end
      params[:response] = params[:response].to_i
      params
    end
  end
  
  class CardInfo
    attr_accessor :number, :expiration, :cvv
    
    def initialize(info)
      @number = info[:number]
      @expiration = info[:expiration]
      @cvv = info[:cvv]
    end
    
    def to_hash
      {
        cardnum: @number,
        cardexp: @expiration.is_a?(Date) ? @expiration.strftime('%y%m') : @expiration,
        cvv: @cvv,
        
      }
    end
    
  end
  
  class Response
  end
  
  class ConnectionError < StandardError
  end
end
