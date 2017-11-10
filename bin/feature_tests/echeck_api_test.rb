class EcheckAPITest < SparrowOne::TestRunner
  def api
    @api ||= SparrowOne::EcheckAPI.new(TEST_KEYS[:echeck])
  end

  def run
    sale_one = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.33", transid: '123456', address1: "123 Home Town", city: "Las Vegas", state: "NV", zip: "89108", country: "US" })
    sale_two = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.28", transid: '123456', address1: "123 Home Town", city: "Las Vegas", state: "NV", zip: "89108", country: "US" })

    sale_three = specify(:sale, { bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "7.89",
                          firstname: "Mark", lastname: "Tabler", address1: "123 Home Town", city: "Las Vegas", state: "NV", zip: "89108", country: "US" })
    sale_four = specify(:sale, { bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "4.56", company: "Falling Man Studios",
                          firstname: "Mark", lastname: "Tabler", address1: "123 Home Town", city: "Las Vegas", state: "NV", zip: "89108", country: "US" })

    # Faulty examples
    # Transaction lookups not working for ACH / Echeck transactions. Confirmed by RL.
    # I note that "credit" operations work for the ACH API, where a `transid` is not required,
    # but failing on the Echeck API where a `transid` is mandatory.
    void1 = skip(:void, { transid: sale_three["transid"] })
    void2 = skip(:void, { transid: sale_four["transid"] })
    refund1 = skip(:refund, {transid: sale_one["transid"], bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.25",
                         firstname: "Mark", lastname: "Tabler", address1: "123 Home Town", city: "Las Vegas", state: "NV", zip: "89108", country: "US" })
    refund2 = skip(:refund, { transid: sale_two["transid"], bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.01",
                         firstname: "Mark", lastname: "Tabler", address1: "123 Home Town", city: "Las Vegas", state: "NV", zip: "89108", country: "US" })
    credit_one = skip(:credit, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.23", company: "Falling Man Studios",
                                 transid: sale_three['transid'], address1: "123 Home Town", city: "Las Vegas", state: "NV", zip: "89108", country: "US" })
  end
end
