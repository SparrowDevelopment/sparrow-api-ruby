class CardAPITest
  def self.run(options)
    self.new(options).run
  end

  def initialize(options)
    @verbose = options[:verbose]
  end

  def api
    @api ||= SparrowOne::CardAPI.new(TEST_KEYS[:credit_card])
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

  def run
    puts "\nCard Sales"
    sale_one = api.sale(cardnum: '4111111111111111', cardexp: '1019', amount: '1.25', cvv: '999')
    log sale_one

    sale_two = api.sale(state: "NV", cardnum: '4111111111111111', cardexp: '1019', amount: '2.25', cvv: '999')
    log sale_two

    puts "\nCard Refunds"
    # Full refund
    refund1 = api.refund(transid: sale_one["transid"], amount: "1.25")
    log refund1

    # Partial refund
    refund2 = api.refund(transid: sale_two["transid"], amount: "1.00")
    log refund2

    puts "\nCard Auths"
    auth_one = api.auth(cardnum: '4111111111111111', cardexp: '1019', amount: '3.25', cvv: '999')
    log auth_one

    auth_two = api.auth(cardnum: '4111111111111111', cardexp: '1019', amount: '4.25', cvv: '999', firstname: "Joe")
    log auth_two

    puts "\nCard Voids"
    void1 = api.void(transid: auth_one["transid"])
    log void1

    void2 = api.void(transid: auth_two["transid"])
    log void2

    puts "\nCard Offline Transactions"

    offline_one = api.offline(cardnum: '4111111111111111', cardexp: '1019', amount: '5.25', cvv: '999', authcode: '123456', authdate: '01/31/2017')
    log offline_one

    offline_two = api.offline(cardnum: '4111111111111111', cardexp: '1019', amount: '6.25', cvv: '999', authcode: '123456', authdate: '01/31/2017', firstname: "Mark")
    log offline_two

    puts "\nCard Credits"
    credit_one = api.credit(cardnum: '4111111111111111', cardexp: '1019', amount: '7.25', cvv: '999', authcode: '123456', authdate: '01/31/2017')
    log credit_one

    credit_two = api.credit(cardnum: '4111111111111111', cardexp: '1019', amount: '8.25', cvv: '999', authcode: '123456', authdate: '01/31/2017', firstname: "Mark")
    log credit_two

    puts "\nCard Captures"

    auth_three = api.auth(cardnum: '4111111111111111', cardexp: '1019', amount: '9.25', cvv: '999')
    auth_four = api.auth(cardnum: '4111111111111111', cardexp: '1019', amount: '10.25', cvv: '999', firstname: "Joe")

    capture_one = api.capture(transid: auth_three['transid'], amount: '9.25')
    log capture_one
    capture_two = api.capture(transid: auth_four['transid'], amount: '3.25')
    log capture_two

    puts "\nCard Verifications"
    verification_one = api.verify(cardnum: '4111111111111111', cardexp: '1019', cvv: '999')
    log verification_one, /Invalid amount/, 'Unexpected API Behavior: Invalid amount error'
    verification_two = api.verify(cardnum: '4111111111111111', cardexp: '1019', cvv: '999', firstname: "Joe")
    log verification_two, /Invalid amount/, 'Unexpected API Behavior: Invalid amount error'

    puts "\nCard Passenger Sales"
    passenger_one = api.passenger_sale(cardnum: '4111111111111111', cardexp: '1019', cvv: '999', passengername: "Captain Kangaroo", airportcode1: "LAS", amount: "99.95",
                                       airlinecodenumber: 'SWA', ticketnumber: "0123456789", flightdatecoupon1: "09/30/2019", flightdeparturetimecoupon1: "09:30",
                                       approvalcode: '123456', authcharindicator: 'E', validationcode: '1234', authresponsecode: "AB")
    log passenger_one, /Operation type is not supported/, "Unexpected API Behavior: Operation Type not supported by payment processor:"

    puts "\nCard Balances"
    balance_one = api.balance(cardnum: '4111111111111111')
    log balance_one, /Operation type is not supported/, "Unexpected API Behavior: Operation Type not supported by payment processor:"

    puts "\nCard Chargeback"
    puts "--Fault: Not tested"

    puts "\nCard Bad Transactions"

    bad_sale = api.sale(firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.23")
    log bad_sale, /missing parameters/

    bad_void = api.void(transid: sale_two["transid"])
    log bad_void, /Void operation must follow/

    auth_five = api.auth(cardnum: '4111111111111111', cardexp: '1019', amount: '19.25', cvv: '999')
    bad_capture = api.capture(transid: auth_five['transid'], amount: '199.95')
    log bad_capture, /more than authorized/
  end
end

class CardFiservAPITest < CardAPITest

  def api
    @api ||= SparrowOne::FiservAPI.new(TEST_KEYS[:credit_card])
  end

  def run
    puts "***** Fiserv API Calls Begin *****"
    super
    puts "*****  Fiserv API Calls End  *****"
  end

end
