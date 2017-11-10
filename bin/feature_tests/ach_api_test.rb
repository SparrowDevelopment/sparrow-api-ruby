class ACHAPITest < SparrowOne::TestRunner


  def api
    @api ||= SparrowOne::ACHAPI.new(TEST_KEYS[:echeck])
  end

  def run
    # Can't run two credits back-to-back; triggers an anti-duplication mechanism.
    puts "\nACH Credit 1"
    credit_one = specify(:credit, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.23" })

    puts "\nACH Sales"
    sale_one = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.29" })

    sale_two = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", company: "Falling Man Studios", amount: '1.23' })

    puts "\nACH Refunds"
    # Full refund
    refund1 = specify(:refund, { transid: sale_one["transid"], bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.25" })

    # Partial refund
    refund2 = specify(:refund, { transid: sale_two["transid"], bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.01" })

    puts "\nACH Voids"
    sale_three = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "7.89" })
    sale_four = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "4.56", company: "Falling Man Studios" })

    void1 = specify(:void, { transid: sale_three["transid"] })

    void2 = specify(:void, { transid: sale_four["transid"] })

    puts "\nACH Credit 2"
    credit_two = specify(:credit, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.23", company: "Falling Man Studios" })

    puts "\nACH Bad Transactions (with expected failure types)"

    bad_sale = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal" })
      end
end
