require "sparrow/version"
require 'rest-client'

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
      uri = URI(@config[:api_endpoint])
      res = Net::HTTP.post_form(uri, 'q' => 'ruby', 'max' => '50')
      
      $response = $this->client->request('POST', '', [
        'form_params' => array_merge([
          'mkey'=>$this->config->mkey,
          'transtype' => 'sale',
          'amount'=>$amount,
        ], $ci->toArray())
      ]);
      $code = $response->getStatusCode();
      if($code!=200)
      {
        throw new ConnectionException("Sparrow API is not responding.");
      }
      $qs = $response->getBody()->getContents();
      $r = new Response($qs);
      return $r;
      
      Response.new
    end
  end
  
  class CardInfo
    def initialize(**options)
    end
  end
  
  class Response
  end
  
  class ConnectionError < StandardError
  end
end
