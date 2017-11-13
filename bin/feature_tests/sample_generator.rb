class SparrowOne::SampleGenerator < SparrowOne::TestRunner
  def formatted_example(name, method, params, result)
    lines = []
    puts "### #{name}\n"
    separator = "~" * 80
    lines << "\nCODE:\n\n#{separator}"
    lines << "api.#{method}({"
    params.each do |k, v|
      lines << "  #{k}: '#{v}',"
    end
    lines << "})"
    lines << "#{separator}\n\nRESULT:\n\n#{separator}\n\n"
    if result.respond_to?(:parsed_response)
      fields = result.parsed_response.keys
    else
      fields = result.keys
    end
    fields.each do |field|
      lines << "result.#{field} # => '#{result[field]}'"
    end
    lines << "\n#{separator}\n\n"
    lines
  end

  def api
    @api
  end

  def example(name, method, params, matcher = /success/i)
    response = @api.send(method, params)
    if response['textresponse'].match(matcher) || response.success?
      formatted_example(name, method, params, response)
    else
      raise "Unexpected error in #{@api.class}##{method}: received #{response.to_json}\nParams: #{params}"
    end
  end

  def initialize
  end

  def run
    examplize_ach
    examplize_cards
    examplize_data_vault
    examplize_echeck
    examplize_ewallet
    examplize_fiserv
    examplize_starcard
  end

  def examplize_ach
    @api = SparrowOne::ACHAPI.new(TEST_KEYS[:echeck])
    puts example("ACH Simple Sale", :sale, { bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: 'checking', achaccountsubtype: 'personal', amount: '9.95', firstname: 'John', lastname: 'Doe"' })
    puts example("ACH Advanced Sale", :sale, { bankname: 'First Test Bank', routing: '110000000', account: '1234567890123', achaccounttype: 'checking', achaccountsubtype: 'personal', amount: '9.95', orderdesc: 'Order Description', orderid: '11111', firstname: 'John', lastname: 'Doe', company: 'Sparrow One', address1: '16100 N 71st Street', address2: 'Suite 170', city: 'Scottsdale', state: 'AZ', zip: '85254', country: 'US', phone: '7025551234', email: 'john@norepy.com', shipaddress1: '16100 N 72nd Street', shipaddress2: 'Suite 171', shipcity: 'Pheonix', shipstate: 'AZ', shipzip: '85004', shipcountry: 'US', shipphone: '6025551234', shipemail: 'jane@noreply.com', saveclient: 'true', updateclient: 'true', opt_amount_type_1: 'surcharge', opt_amount_value_1: '1.01', opt_amount_percentage_1: '18', birthdate: '01/31/2000', checknumber: '123', driverlicensenumber: '1234567890', driverlicensecountry: 'US', driverlicensestate: 'AZ', sendtransreceipttobillemail: 'true', sendtransreceipttoshipemail: 'true', paymentdescriptor: 'Custom Payment Descriptor' })

  end

  def examplize_cards
    @api = SparrowOne::CardAPI.new(TEST_KEYS[:credit_card])
    puts example("Card Simple Sale", :sale, { amount: '9.95', cardnum: '4111111111111111', cardexp: '1010', cvv: '999' })
    puts example("Card Advanced Sale", :sale, { amount: '57.85', cardnum: '4111111111111111', cardexp: '1010', cvv: '999', skunumber_1: '5558779', description_1: 'menssweaterblue', amount_1: '50.00', quantity_1: '1', tax: '2.85', shipamount: '5.00', firstname: 'John', lastname: 'Smith', address1: '888 test address', city: 'Los Angeles', country: 'US', state: 'CA', phone: '222-444-2938', shipfirstname: 'John', shiplastname: 'Smith', shipaddress1: '888 test address', shipcity: 'Los Angeles', shipstate: 'CA', shipphone: '2224442938' })
    puts example("Card Simple Auth", :auth, { amount: '9.95', cardnum: '4111111111111111', cardexp: '1010', cvv: '999' })
    puts formatted_example("Card Simple Capture", :capture, {:transid=>"10934003", :amount=>"9.25"}, {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10934003", "xref"=>"3865034963", "authcode"=>"123456", "type"=>"capture", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"})
    puts example("Card Simple Offline Capture", :offline, { amount: '9.95', cardnum: '4111111111111111', cardexp: '1010', cvv: '999', authcode: '987654', authdate: '03/25/2016' })
    puts formatted_example("Card Advanced Capture", :capture, { amount: '9.95', transid: '123456', sendtransreceipttobillemail: 'true', orderid: '54321' }, {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"123456", "xref"=>"3865035008", "authcode"=>"654321", "type"=>"capture", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"})
    puts formatted_example("Card Simple Refund", :refund, { :transid=>"10933995", :amount=>"1.25" }, {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10933995", "xref"=>"3865034307", "authcode"=>"123456", "type"=>"refund", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"} )
    puts formatted_example("Card Advanced Refund", :refund, { transid: '10750789', amount: '9.95', sendtransreceipttobillemail: 'true', sendtransreceipttoshipemail: 'true', sendtransreceipttoemails: 'email@email.com' }, { response: '1', textresponse: 'SUCCESS', transid: '10750789', xref: '3829708545', authcode: '123456', orderid: '', type: 'refund', avsresponse: '', cvvresponse: 'M', coderesponse: '100', codedescription: 'Transaction was Approved', status: '200' } )
    puts formatted_example("Card Simple Void", :void, { transid: '12345678' }, { response: '1', textresponse: 'Transaction Void Successful', transid: '10750790', xref: '3829708544', authcode: '123456', orderid: '', type: 'void', avsresponse: '', cvvresponse: 'M', coderesponse: '100', codedescription: 'Transaction was Approved', status: '200' } )
    puts example("Card Simple Credit", :credit, { cardnum: '4111111111111111', cardexp: '1019', amount: '7.25', cvv: '999', authcode: '123456', authdate: '01/31/2017' })
    puts formatted_example("Card Chargeback", :chargeback, { :transid=>"10934104", :reason=>"Card reported lost" }, {"response"=>"1", "textresponse"=>"Card reported lost", "transid"=>"10934104", "xref"=>"3865091326", "authcode"=>"123456", "type"=>"chargeback", "cvvresponse"=>"M", "status"=>"200"})
    puts formatted_example("Card Passenger Sale", :passenger_sale, { cardnum: '4111111111111111', cardexp: '1019', amount: '9.95', cvv: '999', passengername: 'John Doe', stopovercode1: 'O', airportcode1: 'LAS', airportcode2: 'CDG', airportcode3: 'IAD', airportcode4: 'CPH', carriercoupon4: 'AA;BB', airlinecodenumber: 'AA0', ticketnumber: '1234567890', classofservicecoupon4: '00;AA', flightdatecoupon1: '01/31/2017', flightdeparturetimecoupon1: '23:59', addressverificationcode: 'A', approvalcode: '123456', transactionid: '1234567890', authcharindicator: 'A', referencenumber: '123456789012', validationcode: '1234', authresponsecode: 'AB' },
                            { response: '1', textresponse: 'SUCCESS', transid: '10750803', xref: '3829708653', authcode: '123456', orderid: '', type: 'sale', avsresponse: '', cvvresponse: 'M', coderesponse: '100', codedescription: 'Transaction was Approved', status: '200' })
    puts formatted_example("Card Verification", :balance, { cardnum: '4111111111111111', cardexp: '1019', amount: '9.95', cvv: '999', zip: '85254"' }, { response: '1', textresponse: 'SUCCESS', transid: '10750787', xref: '3829708536', authcode: '123456', orderid: '', type: 'auth', avsresponse: 'N', cvvresponse: 'M', coderesponse: '100', codedescription: 'Transaction was Approved', status: '200' })
  end

  def examplize_data_vault
    @api = SparrowOne::CardAPI.new(TEST_KEYS[:credit_card])
    puts example("Data Vault Advanced Add Customer", :addcustomer, { firstname: 'John', lastname: 'Doe', note: 'Customer Note', address1: '16100 N 71st Street', address2: 'Suite 170', city: 'Scottsdale', state: 'AZ', zip: '85254', country: 'US', email: 'john@norepy.com', shipfirstname: 'Jane', shiplastname: 'Doe', shipcompany: 'Sparrow Two', shipaddress1: '16100 N 72nd Street', shipaddress2: 'Suite 171', shipcity: 'Pheonix', shipstate: 'AZ', shipzip: '85004', shipcountry: 'US', shipphone: '6025551234', shipemail: 'jane@noreply.com', username: 'JohnDoe17101717530877', password: 'Password123', clientuseremail: 'john@norepy.com', paytype_1: 'creditcard', paytype_2: 'check', firstname_1: 'John', firstname_2: 'John', lastname_1: 'Doe', lastname_2: 'Doe', address1_1: '123 Main Street', address1_2: '321 1st Street', address2_1: 'Suite 1', address2_2: 'Suite 2', city_1: 'Pheonix', city_2: 'Scottsdale', state_1: 'AZ', state_2: 'AZ', zip_1: '85111', zip_2: '85222', country_1: 'US', country_2: 'US', phone_1: '6025551234', phone_2: '6025554321', email_1: 'john@norepy.com', email_2: 'jane@noreploy.com', cardnum_1: '4111111111111111', cardnum_2: '4111111111111111', cardexp_1: '1019', cardexp_2: '1019', bankname_1: '', bankname_2: 'First Test Bank', routing_1: '', routing_2: '110000000', account_1: '', account_2: '1234567890123', achaccounttype_1: '', achaccounttype_2: 'personal', payno_1: '1', payno_2: '2' })
    puts example("Data Vault Simple Add Customer (With Card)", :addcustomer, { firstname: 'John', lastname: 'Doe', paytype_1: 'creditcard', cardnum_1: '4111111111111111', cardexp_1: '0220' } )
    puts example("Data Vault Simple Add Customer (With Star Card)", :addcustomer, { firstname: 'John', lastname: 'Doe', paytype_1: 'starcard', cardnum_1: '6019440000011111', CID: '52347800001' } )
    puts example("Data Vault Simple Add Customer (With Ewallet)", :addcustomer, { firstname: 'John', lastname: 'Doe', paytype_1: 'ewallet', ewallettype_1: 'paypal', ewalletaccount_1: 'email@email.com' } )
    puts formatted_example("Data Vault Update Customer", :updatecustomer, { token: 'B31388EA20ABF2776C93', address1: '939 St. Winnie’s st.', city: 'Forest City' }, { response: '1', textresponse: "Customer with token 'O3BEZTT2UHCS7USA' successfully updated", type: 'updatecustomer', customertoken: 'O3BEZTT2UHCS7USA' })

    customer = api.addcustomer( { firstname: "Dude", lastname: "Fella", paytype_1: 'creditcard', cardnum_1: "4111111111111111", cardexp_1: '1019' })
    paytype = api.add_payment_type( { token: customer['customertoken'], operationtype_1: "updatepaytype", token_1: customer['paymenttoken_1'], achaccounttype_1: 'savings' })
    plan = api.addplan( { planname: "Sample Plan", plandesc: "Example Description", startdate: "01/01/2019" })
    puts example("Data Vault Add Payment Plan", :add_plan, { planname: "Example Plan Name", plandesc: "Example Plan Description", startdate: "01/01/2019" })

    puts example("Data Vault Update Payment Plan", :updateplan, { token: plan['plantoken'], plandesc: "Example Plan Description" })


    puts example("Data Vault Add Payment Plan Sequence", :add_sequence, {
      token: plan['plantoken'],
      operationtype_1: "addsequence",
      sequence_1: '1',
      amount_1: '50.00',
      scheduletype_1: 'monthly',
      scheduleday_1: '7',
      duration_1: '12',
      description_1: 'Bi-weekly',
    })

    puts example("Data Vault Assign Payment Plan", :assign_plan, { customertoken: customer['customertoken'], plantoken: plan['plantoken'], paymenttoken: customer['paymenttoken_1'], amount: "100.00" })
    puts example("Data Vault Delete Payment Plan", :delete_plan, { token: plan['plantoken'] })
    puts example("Data Vault Delete Payment Type", :delete_payment_type, { token: customer['customertoken'], operationtype_1: "deletepaytype", token_1: customer['paymenttoken_1'], achaccounttype_1: 'savings' })
    puts example("Data Vault Delete Customer", :delete_customer, { token: customer['customertoken'] })

    puts example("Data Vault Create Invoice", :create_invoice, { invoicedate: "10/15/2018", currency: "USD", invoiceamount: "212.95", invoicestatus: "draft" })
    invoice = api.create_invoice({ invoicedate: "10/15/2018", currency: "USD", invoiceamount: "212.95", invoicestatus: "draft" })
    puts example("Data Vault Get Invoice", :get_invoice, { invoicenumber: invoice['invoicenumber'] })
    puts example("Data Vault Update Invoice", :update_invoice, { invoicenumber: invoice['invoicenumber'], invoicestatus: "active" })
    puts example("Data Vault Pay Invoice", :pay_invoice, { invoicenumber: invoice['invoicenumber'], cardnum: "4111111111111111", cardexp: '1019' })

    invoice = api.create_invoice({ invoicedate: "10/15/2018", currency: "USD", invoiceamount: "212.95", invoicestatus: "draft" })
    puts example("Data Vault Cancel Invoice", :cancel_invoice, { invoicenumber: invoice['invoicenumber'], invoicestatusreason: "Customer allergic to product" })
  end

  def examplize_echeck
    @api = SparrowOne::EcheckAPI.new(TEST_KEYS[:echeck])
    puts example("Echeck Simple Sale", :sale, { amount: '9.95', bankname: 'BankofAmerica', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: 'business', company: 'CompanyName', firstname: 'Henry', lastname: 'Johnson', address1: 'Main Street 45', city: 'Scottsdale', zip: '12345', country: 'US', state: 'AZ' })
    puts example("Echeck Advanced Sale", :sale, { amount: '9.95', bankname: 'BankofAmerica', routing: '110000000', account: '1234567890123', achaccounttype: "checking", achaccountsubtype: 'business', company: 'CompanyName', firstname: 'Henry', lastname: 'Johnson', address1: 'Main Street 45', city: 'Scottsdale', zip: '12345', country: 'US', state: 'AZ', phone: '8526547896', email: 'hjohnson@test.com' })
  end

  def examplize_ewallet
    @api = SparrowOne::EwalletAPI.new(TEST_KEYS[:ewallet])
    puts example("Ewallet Simple Credit", :credit, { ewalletaccount: 'user@example.com', ewallet_type: 'PayPal', amount: '9.95', currency: 'USD' } )
  end

  def examplize_fiserv
    @api = SparrowOne::CardAPI.new(TEST_KEYS[:credit_card])
    puts example("Fiserv Simple Sale", :sale, { cardnum: '4111111111111111', cardexp: '1019', amount: '9.95' })
    puts example("Fiserv Advanced Sale", :sale, { cardnum: '4111111111111111', cardexp: '1019', amount: '9.95', cvv: '999', currency: 'USD', firstname: 'John', lastname: 'Doe', skunumber_1: '123', skunumber_2: '456', description_1: 'Blue widget', description_2: 'Brown widget', amount_1: '1.99', amount_2: '2.99', quantity_1: '1', quantity_2: '2', orderdesc: 'Order Description', orderid: '11111', cardipaddress: '8.8.8.8', tax: '0.25', shipamount: '1.25', ponumber: '22222', company: 'Sparrow One', address1: '16100 N 71st Street', address2: 'Suite 170', city: 'Scottsdale', state: 'AZ', zip: '85254', country: 'US', email: 'john@norepy.com', shipfirstname: 'Jane', shiplastname: 'Doe', shipcompany: 'Sparrow Two', shipaddress1: '16100 N 72nd Street', shipaddress2: 'Suite 171', shipcity: 'Pheonix', shipstate: 'AZ', shipzip: '85004', shipcountry: 'US', shipphone: '6025551234', shipemail: 'jane@noreply.com' } )
  end

  def examplize_starcard
    @api = SparrowOne::StarcardAPI.new(TEST_KEYS[:star_card])

    puts formatted_example("Star Card Simple Sale", :sale, { cardnum: '6019440000011111', amount: '20.00', CID: '52347800001' }, { response: '1', textresponse: 'SUCCESS', transid: '10750791', xref: '3829708548', authcode: '123456', orderid: '', type: 'sale', avsresponse: '', cvvresponse: '', coderesponse: '100', codedescription: 'Transaction was Approved', status: '200' } )
    puts formatted_example("Star Card Advanced Sale", :sale, { amount: '57.85', cardnum: '6019440000011111', CID: '12345678911', cardexp: '1010', cvv: '999', skunumber_1: '5558779', description_1: 'menssweaterblue', amount_1: '50.00', quantity_1: '1', tax: '2.85', shipamount: '5.00', firstname: 'John', lastname: 'Smith', address1: '888 test address', city: 'Los Angeles', country: 'US', state: 'CA', phone: '222-444-2938', shipfirstname: 'John', shiplastname: 'Smith', shipaddress1: '888 test address', shipcity: 'Los Angeles', shipstate: 'CA', shipphone: '2224442938' }, { response: '1', textresponse: 'SUCCESS', transid: '10750808', xref: '3829708587', authcode: '123456', orderid: '11111', type: 'sale', avsresponse: 'N', cvvresponse: '', coderesponse: '100', codedescription: 'Transaction was Approved', status: '200' } )
  end

end
