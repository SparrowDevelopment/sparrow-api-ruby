class ACHAPITest
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
    @api ||= SparrowOne::ACHAPI.new(TEST_KEYS[:echeck])
  end

  def run
    # Can't run two credits back-to-back; triggers an anti-duplication mechanism.
    puts "\nACH Credit 1"
    credit_one = api.credit(firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.23")
    log credit_one

    puts "\nACH Sales"
    sale_one = api.sale(firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.29")
    log sale_one

    sale_two = api.sale(firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", company: "Falling Man Studios", amount: '1.23')
    log sale_two

    puts "\nACH Refunds"
    # Full refund
    refund1 = api.refund(transid: sale_one["transid"], bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.25")
    log refund1, /Transaction not found/, "Unexpected API Behavior - known good transaction ID is not found"

    # Partial refund
    refund2 = api.refund(transid: sale_two["transid"], bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.01")
    log refund2, /Transaction not found/, "Unexpected API Behavior - known good transaction ID is not found"

    puts "\nACH Voids"
    sale_three = api.sale(firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "7.89")
    sale_four = api.sale(firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "4.56", company: "Falling Man Studios")

    void1 = api.void(transid: sale_three["transid"])
    log void1, /Transaction not found/, "Unexpected API Behavior - known good transaction ID is not found"

    void2 = api.void(transid: sale_four["transid"])
    log void2, /Transaction not found/, "Unexpected API Behavior - known good transaction ID is not found"

    puts "\nACH Credit 2"
    credit_two = api.credit(firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.23", company: "Falling Man Studios")
    log credit_two

    puts "\nACH Bad Transactions (with expected failure types)"

    bad_sale = api.sale(firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal")
    log bad_sale, /missing parameters/
  end
end
