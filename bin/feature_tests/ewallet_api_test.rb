class EwalletAPITest
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
    @api ||= SparrowOne::EwalletAPI.new(TEST_KEYS[:ewallet])
  end

  def run
    puts "\neWallet Credits"
    credit_one = api.credit(ewallettype: 'PayPal', ewalletaccount: "user@example.com", amount: '7.25')
    log credit_one

    credit_two = api.credit(ewallettype: 'PayPal', ewalletaccount: "user@example.com", amount: '4.25', currency: "USD")
    log credit_two

    sale_one = api.sale(ewallettype: 'PayPal', ewalletaccount: "user@example.com", amount: '4.25', currency: "USD")
    puts "\neWallet Sale"
    log sale_one, /credit operations only/, "Expect error: eWallet handles credits only"

  end
end
