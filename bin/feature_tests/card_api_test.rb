class CardAPITest < SparrowOne::TestRunner

  def api
    @api ||= SparrowOne::CardAPI.new(TEST_KEYS[:credit_card])
  end

  def run
    # Card Sales
    sale_one = specify(:sale, {cardnum: '4111111111111111', cardexp: '1019', amount: '1.25', cvv: '999'})
    sale_two = specify(:sale, {state: "NV", cardnum: '4111111111111111', cardexp: '1019', amount: '2.25', cvv: '999'})

    # Card Refunds
    # Full refund
    refund1 = specify(:refund, { transid: sale_one["transid"], amount: "1.25" })
    # Partial refund
    refund2 = specify(:refund, { transid: sale_two["transid"], amount: "1.00" })

    # Card Auths
    auth_one = specify(:auth, { cardnum: '4111111111111111', cardexp: '1019', amount: '3.25', cvv: '999' })
    auth_two = specify(:auth, { cardnum: '4111111111111111', cardexp: '1019', amount: '4.25', cvv: '999', firstname: "Joe" })

    # Card Voids
    void1 = specify(:void, { transid: auth_one["transid"] })
    void2 = specify(:void, { transid: auth_two["transid"] })

    # Card Offline Transactions
    offline_one = specify(:offline, { cardnum: '4111111111111111', cardexp: '1019', amount: '5.25', cvv: '999', authcode: '123456', authdate: '01/31/2017' })
    offline_two = specify(:offline, { cardnum: '4111111111111111', cardexp: '1019', amount: '6.25', cvv: '999', authcode: '123456', authdate: '01/31/2017', firstname: "Mark" })

    # Card Credits
    credit_one = specify(:credit, { cardnum: '4111111111111111', cardexp: '1019', amount: '7.25', cvv: '999', authcode: '123456', authdate: '01/31/2017' })
    credit_two = specify(:credit, { cardnum: '4111111111111111', cardexp: '1019', amount: '8.25', cvv: '999', authcode: '123456', authdate: '01/31/2017', firstname: "Mark" })

    # Card Captures
    auth_three = specify(:auth, { cardnum: '4111111111111111', cardexp: '1019', amount: '9.25', cvv: '999' })
    auth_four = specify(:auth, { cardnum: '4111111111111111', cardexp: '1019', amount: '10.25', cvv: '999', firstname: "Joe" })
    capture_one = specify(:capture, { transid: auth_three['transid'], amount: '9.25' })
    capture_two = specify(:capture, { transid: auth_four['transid'], amount: '3.25' })

    # Card Verifications
    verification_one = fault("Verification giving 'bad amount' error", :verify, { cardnum: '4111111111111111', cardexp: '1019', cvv: '999' })
    verification_two = fault("Verification giving 'bad amount' error",:verify, { cardnum: '4111111111111111', cardexp: '1019', cvv: '999', firstname: "Joe" })

    # Card Passenger Sales
    passenger_one = fault("Passenger sale giving 'Operation type not supported'", :passenger_sale, {cardnum: '4111111111111111', cardexp: '1019', cvv: '999', passengername: "Captain Kangaroo", airportcode1: "LAS", amount: "99.95",
                                       airlinecodenumber: 'SWA', ticketnumber: "0123456789", flightdatecoupon1: "09/30/2019", flightdeparturetimecoupon1: "09:30",
                                       approvalcode: '123456', authcharindicator: 'E', validationcode: '1234', authresponsecode: "AB"})

    # Card Balances
    fault("Balance giving 'Operation type not supported'", :balance, { cardnum: '4111111111111111' })

    # Card Chargebacks
    sale_for_chargeback = specify(:sale, { cardnum: '4111111111111111', cardexp: '1019', amount: '111.25', cvv: '999' })
    chargeback_one = specify(:chargeback, { transid: sale_for_chargeback['transid'], reason: "Card reported lost" })


    # Deliberate failure transactions
    specify(:sale, { firstname: "Mark", lastname: "Tabler", bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: "personal", amount: "1.23" }, /missing parameters: cardnum, cardexp/)
    specify(:void, { transid: sale_two["transid"] }, /Void operation must follow/)
    auth_five = specify(:auth, { cardnum: '4111111111111111', cardexp: '1019', amount: '19.25', cvv: '999' } )
    specify(:capture, { transid: auth_five['transid'], amount: '199.95' }, /Cannot capture more than authorized/)
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
