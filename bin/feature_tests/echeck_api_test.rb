class EcheckAPITest < SparrowOne::TestRunner
  def api
    @api ||= SparrowOne::EcheckAPI.new(TEST_KEYS[:echeck])
  end

  def run
    puts "\nECheck Sales"
    sale_one = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.33", transid: '123456', address1: "123 Home Town", city: "Las Vegas", state: "NV", zip: "89108", country: "US" })
    log sale_one

    sale_two = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.28", transid: '123456', address1: "123 Home Town", city: "Las Vegas", state: "NV", zip: "89108", country: "US" })
    log sale_two

    puts "\nECheck Refunds"
    # Full refund
    refund1 = api.refund(transid: sale_one["transid"], bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.25",
                         firstname: "Mark", lastname: "Tabler", address1: "123 Home Town", city: "Las Vegas", state: "NV", zip: "89108", country: "US")
    log refund1, /Transaction not found/, "Unexpected API Behavior - known good transaction ID is not found"

    # Partial refund
    refund2 = api.refund(transid: sale_two["transid"], bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.01",
                         firstname: "Mark", lastname: "Tabler", address1: "123 Home Town", city: "Las Vegas", state: "NV", zip: "89108", country: "US")
    log refund2, /Transaction not found/, "Unexpected API Behavior - known good transaction ID is not found"

    puts "\nECheck Voids"
    sale_three = api.sale(bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "7.89",
                          firstname: "Mark", lastname: "Tabler", address1: "123 Home Town", city: "Las Vegas", state: "NV", zip: "89108", country: "US")
    sale_four = api.sale(bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "4.56", company: "Falling Man Studios",
                          firstname: "Mark", lastname: "Tabler", address1: "123 Home Town", city: "Las Vegas", state: "NV", zip: "89108", country: "US")

    void1 = specify(:void, { transid: sale_three["transid"] })
    log void1, /Transaction not found/, "Unexpected API Behavior - known good transaction ID is not found"

    void2 = specify(:void, { transid: sale_four["transid"] })
    log void2, /Transaction not found/, "Unexpected API Behavior - known good transaction ID is not found"

    puts "\nECheck Credit"
    credit_one = api.credit(firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.23", company: "Falling Man Studios",
                            transid: sale_three['transid'], address1: "123 Home Town", city: "Las Vegas", state: "NV", zip: "89108", country: "US")
    log credit_one, /Transaction not found/, "Unexpected API Behavior - known good transaction ID is not found"

    puts "\nECheck Bad Transactions (with expected failure types)"

    bad_sale = specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal" })
    log bad_sale, /missing parameters/
  end
end
