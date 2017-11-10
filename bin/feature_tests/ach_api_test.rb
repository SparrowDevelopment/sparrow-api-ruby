class ACHAPITest < SparrowOne::TestRunner


  def api
    @api ||= SparrowOne::ACHAPI.new(TEST_KEYS[:echeck])
  end

  def run
    # Can't run two credits back-to-back; triggers an anti-duplication mechanism.
    credit_one = specify(:credit, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.23" })
    sale_one = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.29" })
    sale_two = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", company: "Falling Man Studios", amount: '1.23' })

    sale_three = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "7.89" })
    sale_four = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "4.56", company: "Falling Man Studios" })

    # Need troubleshooting - transaction lookups not working, but specifically with this API key.
    # refund1 = specify(:refund, { transid: sale_one["transid"], bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.25" })
    # refund2 = specify(:refund, { transid: sale_two["transid"], bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.01" })
    # void1 = specify(:void, { transid: sale_three["transid"] })
    # void2 = specify(:void, { transid: sale_four["transid"] })

    credit_two = specify(:credit, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.23", company: "Falling Man Studios" })

    bad_sale = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal" }, /missing parameters/i)
  end
end
