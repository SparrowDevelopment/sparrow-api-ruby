class SharedAPITest < SparrowOne::TestRunner
  def api
    @api ||= SparrowOne::CardAPI.new(TEST_KEYS[:credit_card])
  end

  def run
    puts "\nCustomer Operations:"
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

    puts "\nPayment Plans:"
    puts "Add:"
    plan = api.add_plan(planname: "Lease program", plandesc: "Kinda like rent-to-own but better", startdate: "01/01/2019")
    log plan
    sequencable_plan = api.add_plan(planname: "Lease program", plandesc: "Kinda like rent-to-own but better", startdate: "01/01/2019")
    log sequencable_plan

    puts "Update"
    updated_plan = api.updateplan(token: plan['plantoken'], plandesc: "You get to have it while you're still buying it")
    log updated_plan

    sequenced_plan = api.add_sequence(token: sequencable_plan['plantoken'],
      operationtype_1: "addsequence",
      operationtype_2: "addsequence",
      sequence_1: '1',
      sequence_2: '2',
      amount_1: '50',
      amount_2: '100',
      scheduletype_1: 'custom',
      scheduletype_2: 'monthly',
      scheduleday_1: '7',
      scheduleday_2: '1',
      duration_1: '52',
      duration_2: '26',
      productid_1: 'abc',
      productid_2: 'def',
      description_1: 'Bi-weekly',
      description_2: 'Monthly',
    )
    log sequenced_plan
    puts "Delete"
    deleted_plan = api.delete_plan(token: plan['plantoken'])
    log deleted_plan

    puts "Assign"
    customer_for_plan = api.addcustomer(firstname: "Dude", lastname: "Fella", paytype_1: 'creditcard', cardnum_1: "4111111111111111", cardexp_1: '1019')
    log customer_for_plan
    assigned_plan = api.assign_plan(customertoken: customer_for_plan['customertoken'], plantoken: sequenced_plan['plantoken'], paymenttoken: customer_for_plan['paymenttoken_1'], amount: "800.00" )
    log assigned_plan, /Internal processing error/, "API fault - 'try again later'"

    puts "Update Assignment"
    # updated_assignment = api.update_assignment(assignmenttoken: assigned_plan[''], description: "Updated description" )
    # log updated_assignment
    puts "--fault: Internal processing error creating assignment"
    puts "Cancel Assignment"
    # canceled_assignment = api.cancel_assignment(assignmenttoken: assigned_plan[''], description: "Updated description" )
    # log updated_assignment
    puts "--fault: Internal processing error creating assignment"
    # Datavault
    #
    puts "\nInvoices"
    puts "Creating:"
    invoice = api.create_invoice(invoicedate: "10/15/2018", currency: "USD", invoiceamount: "212.95", invoicestatus: "draft")
    log invoice
    cancelable_invoice = api.create_invoice(invoicedate: "10/15/2018", currency: "USD", invoiceamount: "101.95", invoicestatus: "active")
    log cancelable_invoice
    retrieved_invoice = api.get_invoice(invoicenumber: invoice['invoicenumber'])
    log retrieved_invoice

    puts "Updating:"
    updated_invoice = api.update_invoice(invoicenumber: invoice['invoicenumber'], invoicestatus: "active")
    log updated_invoice

    puts "Paying:"
    paid_invoice = api.pay_invoice(invoicenumber: invoice['invoicenumber'], cardnum: "4111111111111111", cardexp: '1019')
    log paid_invoice


    puts "Canceling:"
    canceled_invoice = api.cancel_invoice(invoicenumber: cancelable_invoice['invoicenumber'], invoicestatusreason: "Allergic to product")
    log canceled_invoice
  end
end
