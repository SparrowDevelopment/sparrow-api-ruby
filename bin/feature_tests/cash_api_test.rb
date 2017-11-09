class CashAPITest
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
    @api ||= SparrowOne::CashAPI.new(TEST_KEYS[:cash])
  end

  def run
  end
end
