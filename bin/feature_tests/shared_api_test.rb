class SharedAPITest < SparrowOne::TestRunner
  def api
    @api ||= SparrowOne::CardAPI.new(TEST_KEYS[:credit_card])
  end

  def run
    puts "\nCustomer Operations:"
    puts "Adding:"
    card_customer = specify(:addcustomer, { firstname: "Dude", lastname: "Fella", paytype_1: 'creditcard', cardnum_1: "4111111111111111", cardexp_1: '1019' })

    ach_customer = specify(:addcustomer, { firstname: "Captain", lastname: "Kangaroo", paytype_1: 'ach', bankname_1: 'Hypothetical S&L', achaccounttype_1: 'checking', achaccountsubtype_1: 'personal', routing_1: '123456789', account_1: '987654321' })

    generic_customer = specify(:addcustomer, { firstname: "Rhubarb", lastname: "McGillicutty" })

    puts "Updating:"
    update_customer = specify(:updatecustomer, { token: ach_customer['customertoken'], firstname: "Admiral", secret_knock: "shave-anda-haircut" })

    added_paytype = specify(:add_payment_type, { token: ach_customer['customertoken'], operationtype_1: "updatepaytype", token_1: ach_customer['paymenttoken_1'], achaccounttype_1: 'savings' })

    missing_param_updated_paytype = specify(:add_payment_type, { token: ach_customer['customertoken'], operationtype_1: "updatepaytype", achaccounttype_1: 'savings' })
        puts "Getting:"
    get_customer = specify(:get_customer, { token: ach_customer['customertoken'] })

    puts "Decrypt custom field:"
    decrypt = specify(:decrypt, { token: ach_customer['customertoken'], fieldname: "account_1" })

    puts "Deleting:"
    deleted_paytype = specify(:delete_payment_type, { token: ach_customer['customertoken'], operationtype_1: "deletepaytype", token_1: ach_customer['paymenttoken_1'], achaccounttype_1: 'savings' })

    delete_customer = specify(:delete_customer, { token: ach_customer['customertoken'] })

    missing_customer = specify(:getcustomer, { token: ach_customer['customertoken'] })
    if missing_customer['CustomerStatus'] == 'Archived'
      puts "  OK"
    else
      puts "--Fault: deleted customer has status #{missing_customer['CustomerStatus']}"
    end

    puts "\nPayment Plans:"
    puts "Add:"
    plan = specify(:add_plan, { planname: "Lease program", plandesc: "Kinda like rent-to-own but better", startdate: "01/01/2019" })
        sequencable_plan = specify(:add_plan, { planname: "Lease program", plandesc: "Kinda like rent-to-own but better", startdate: "01/01/2019" })

    puts "Update"
    updated_plan = specify(:updateplan, { token: plan['plantoken'], plandesc: "You get to have it while you're still buying it" })

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
        puts "Delete"
    deleted_plan = specify(:delete_plan, { token: plan['plantoken'] })

    puts "Assign"
    customer_for_plan = specify(:addcustomer, { firstname: "Dude", lastname: "Fella", paytype_1: 'creditcard', cardnum_1: "4111111111111111", cardexp_1: '1019' })
        assigned_plan = specify(:assign_plan, { customertoken: customer_for_plan['customertoken'], plantoken: sequenced_plan['plantoken'], paymenttoken: customer_for_plan['paymenttoken_1'], amount: "800.00"  })

    puts "Update Assignment"
    # updated_assignment = specify(:update_assignment, { assignmenttoken: assigned_plan[''], description: "Updated description"  })
    #     puts "--fault: Internal processing error creating assignment"
    puts "Cancel Assignment"
    # canceled_assignment = specify(:cancel_assignment, { assignmenttoken: assigned_plan[''], description: "Updated description"  })
    #     puts "--fault: Internal processing error creating assignment"
    # Datavault
    #
    puts "\nInvoices"
    puts "Creating:"
    invoice = specify(:create_invoice, { invoicedate: "10/15/2018", currency: "USD", invoiceamount: "212.95", invoicestatus: "draft" })
        cancelable_invoice = specify(:create_invoice, { invoicedate: "10/15/2018", currency: "USD", invoiceamount: "101.95", invoicestatus: "active" })
        retrieved_invoice = specify(:get_invoice, { invoicenumber: invoice['invoicenumber'] })

    puts "Updating:"
    updated_invoice = specify(:update_invoice, { invoicenumber: invoice['invoicenumber'], invoicestatus: "active" })

    puts "Paying:"
    paid_invoice = specify(:pay_invoice, { invoicenumber: invoice['invoicenumber'], cardnum: "4111111111111111", cardexp: '1019' })


    puts "Canceling:"
    canceled_invoice = specify(:cancel_invoice, { invoicenumber: cancelable_invoice['invoicenumber'], invoicestatusreason: "Allergic to product" })
      end
end
