module SparrowOne
  class Response

    attr_reader :parsed_response
    def initialize(raw_response)
      @parsed_response = parse(raw_response)
    end

    def [](key)
      @parsed_response[key.to_s]
    end

    def method_missing(meth, *args, &blk)
      if @parsed_response[meth.to_s]
        @parsed_response[meth.to_s]
      else
        super
      end
    end

    TRANSACTION_FIELDS = [:transid, :authcode, :xref, :type, :avsresponse, :cvvresponse, :coderesponse, :codedescription]
    def transaction
      transaction_data = {}
      if success?
        TRANSACTION_FIELDS.each do |field_name|
          transaction_data[field_name] = @parsed_response[field_name.to_s]
        end
      else
        nil
      end
      transaction_data
    end

    def success?
      self[:response] == '1' || self[:response] == '00' # ACH gives back 00 for success
    end

    def ok?
      self[:status] =~ /\A2\d\d\z/ ? true : false
    end

    def text_response
      @parsed_response['textresponse']
    end

    def to_json
      @parsed_response.to_json
    end

    private
    def parse(raw_response)
      result = {}
      raw_response.split('&').each do |pair|
        key, value = pair.strip.split('=')
        next unless key.to_s.size >= 1 && value.to_s.size >= 1
        result[key] = CGI.unescape(value)
      end
      result
    end
  end
end
