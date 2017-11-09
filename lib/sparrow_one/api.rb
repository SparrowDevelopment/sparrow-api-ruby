module SparrowOne

  class API
    include SparrowOne::SharedAPIMethods
    # TODO: Double-check mkey length
    # The shortest mkey I've seen is 24 characters; that doesn't
    # mean they can't possibly be shorter than that.
    MIN_MKEY_SIZE = 24
    API_URL = 'https://secure.sparrowone.com/Payments/Services_api.aspx'

    def initialize(mkey = ENV['SPARROW_MKEY'], api = Faraday.new(API_URL))
      @api = api
      @mkey = mkey
      unless @mkey.to_s.size >= MIN_MKEY_SIZE
        raise "Missing valid mkey value - set ENV['SPARROW_MKEY'] or use #{self.class}.new(your_mkey)"
      end
    end

    # Create, Update, Retrieve, Cancel, Cancel(By Customer), PayCredit, PayBank
    # def invoice(params)
    # end

    private

    def with_error_handling(&blk)
      begin
        yield
      rescue SparrowOne::RequestError => e
        SparrowOne::Response.new("status=400&textresponse=#{CGI.escape('Error in request ' + caller[1][/`.*'/][1..-2])}: #{e.message}")
      end
    end

    def validate(given_params, options)
      validator = Validator.new(given_params)
      if options[:requires].any?
        validator.requires(options[:requires])
      end
      validator.validate
    end

    def request_body(params)
      params.map { |k, v| "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}"}.join("&")
    end

    def post(transtype, params)
      raw_response = @api.post do |req|
        req.body = request_body(params.merge(transtype: transtype, mkey: @mkey))
      end
      return SparrowOne::Response.new(raw_response.body)
    end
  end
end
