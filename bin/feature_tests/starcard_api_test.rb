class StarcardAPITest
  def self.run(options)
    self.new(options).run
  end

  def initialize(options)
    @verbose = options[:verbose]
  end

  def log(response, matcher = /success/i, long_notice = "" )
    if @verbose
      puts response.to_json
    end
    if response['textresponse'].match matcher
      if long_notice == ""
        puts "  OK"
      else
        puts "  OK (" + long_notice + ")"
      end
    else
      puts "--Fault: Expected #{response['textresponse']} to match #{matcher.to_s}"
    end
  end

  def api
    @api ||= SparrowOne::StarcardAPI.new(TEST_KEYS[:star_card])
  end

  def run
    puts "\nStar Card Sales:"

    sale_one = api.sale(cardnum: '6019440000011111', cardexp: '1019', amount: '5.25', cvv: '999', CID: '52347800001')
    log sale_one, /CID value is invalid/, "Unexpected API Behavior: Invalid CID"

    sale_two = api.sale(state: "NV", cardnum: '6019440000011111', cardexp: '1019', amount: '5.25', cvv: '999', CID: '52347800001')
    log sale_two, /CID value is invalid/, "Unexpected API Behavior: Invalid CID"

  end
end
