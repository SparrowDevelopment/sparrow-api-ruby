class SharedAPITest
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
    @api ||= SparrowOne::CardAPI.new(TEST_KEYS[:credit_card])
  end

  def run
    puts "Customer Operations:"
    puts "Adding:"
    card_customer = api.addcustomer(firstname: "Dude", lastname: "Fella", paytype_1: 'creditcard', cardnum_1: "4111111111111111", cardexp_1: '1019')
    log card_customer

    ach_customer = api.addcustomer(firstname: "Captain", lastname: "Kangaroo", paytype_1: 'ach', bankname_1: 'Hypothetical S&L', achaccounttype_1: 'checking', achaccountsubtype_1: 'personal', routing_1: '123456789', account_1: '987654321')
    log ach_customer

    generic_customer = api.addcustomer(firstname: "Rhubarb", lastname: "McGillicutty")
    log generic_customer

    puts "Updating:"
    update_customer = api.updatecustomer(token: ach_customer['customertoken'], firstname: "Admiral", secret_knock: "shave-anda-haircut")
    log update_customer

    added_paytype = api.add_payment_type(token: ach_customer['customertoken'], operationtype_1: "updatepaytype", token_1: ach_customer['paymenttoken_1'], achaccounttype_1: 'savings')
    log added_paytype

    missing_param_updated_paytype = api.add_payment_type(token: ach_customer['customertoken'], operationtype_1: "updatepaytype", achaccounttype_1: 'savings')
    log missing_param_updated_paytype, /must have.+payment type token `token_#/
    puts "Getting:"
    get_customer = api.get_customer(token: ach_customer['customertoken'])
    log get_customer, /Processed/

    puts "Decrypt custom field:"
    decrypt = api.decrypt(token: ach_customer['customertoken'], fieldname: "account_1")
    log decrypt, /Custom\ field.+not\ found/, 'Unexpected API behavior: cannot store custom field during update'

    puts "Deleting:"
    deleted_paytype = api.delete_payment_type(token: ach_customer['customertoken'], operationtype_1: "deletepaytype", token_1: ach_customer['paymenttoken_1'], achaccounttype_1: 'savings')
    log deleted_paytype

    delete_customer = api.delete_customer(token: ach_customer['customertoken'])
    log delete_customer

    missing_customer = api.getcustomer(token: ach_customer['customertoken'])
    if missing_customer['CustomerStatus'] == 'Archived'
      puts "  OK"
    else
      puts "--Fault: deleted customer has status #{missing_customer['CustomerStatus']}"
    end

    puts "Payment Plans:"

    puts "Add:"
    plan = api.add_plan(planname: "Lease program", plandesc: "Kinda like rent-to-own but better", startdate: "01/01/2019")
    log plan

    puts "Update"
    updated_plan = api.updateplan(token: plan['plantoken'], plandesc: "You get to have it while you're still buying it")
    log updated_plan

    puts "Delete"
    deleted_plan = api.delete_plan(token: plan['plantoken'])
    log deleted_plan

    # Datavault
    #
    # Payment Plans
    # build sequence
    # plan notification settings
    # addsequence
    # updatesequence
    # deletesequence
    # deleteplan
    # assignplan
    # updateassignment
    # cancelassignment
    # createinvoice
    # updateinvoice
    # getinvoice
    # cancelinvoice
    # cancelinvoicebycustomer
    # payinvoice
    #   Card
    #   ACH
    #

  end
end
