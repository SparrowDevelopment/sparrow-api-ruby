# SparrowOne

This gem provides an interface to the API described at http://foresight.sparrowone.com/.

## Getting Started

To use the Sparrow API, you will need to get one or more Merchant Keys (mKeys).
An mKey can be found inside the gateway under `Admin > System Configuration > Transaction Routing`.

Each mKey represents one payment type, such as Card, ACH / eCheck, eWallet, or Star Card. Each payment type also has its own API interface in this library - for example, to use an mKey associated with the Card payment type, you would use the SparrowOne::CardAPI interface. Each API type is described in this document. Additionally, some API calls are availble across all payment types; these are described under the heading "Shared API Methods".

You can specify your mKey when you create a SparrowOne API instance: for example, `SparrowOne::CardAPI.new('your_mkey_goes_here')`. Alternatively, if you are only using one mKey, you can set the environment variable SPARROW_MKEY, and this gem will use that mKey by default.

### Response Objects

All SparrowOne::API instance methods return a Response object. Response has these methods:
  - `#status` returns an HTTP status code. If a request fails client-side validation, this will be 400.
  - `#ok?` returns true if the HTTP status code of the request is 2xx; false otherwise.
  - `#success?` returns true if a transaction was successfully completed; false otherwise.
  - `#text_response` returns a plaintext description of the request state. This will include error messages (including client-side validation errors) where applicable, or "SUCCESS" if the request was successful.
  - `#transaction` returns nil if the request was not successful. Otherwise, it returns a hash containing the following keys from the Sparrow API: `[:transid, :authcode, :xref, :type, :avsresponse, :cvvresponse, :coderesponse, :codedescription]`

### Client-side Validation
This gem performs client-side validation of request data prior to making a network call. An API method will validate the format of the parameters it is given, and will ensure that all required parameters are in the list. Detailed parameter formats and requirements are in the main API documentation at http://foresight.sparrowone.com/.

If a request fails client-side validation, a Response object will be returned carrying status '400' and a text_response describing the detected error.

### Examples

Example CardAPI `#sale` request:
```
  api = SparrowOne::CardAPI.new('card_mkey_goes_here')
  response = api.sale(cardnum: '1234567890123456', cardexp: '1220', amount: '29.95')
  response.success?
    # => true
  response.transaction
    # => {:transid=>"10883041", :authcode=>"123456", :xref=>"3856105057", :type=>"sale", :avsresponse=>nil, :cvvresponse=>"M", :coderesponse=>"100", :codedescription=>"Transaction was Approved"}
```

Example CardAPI `#sale` request missing required parameters:
```
  api = SparrowOne::CardAPI.new('card_mkey_goes_here')
  response = api.sale(cardnum: '1234567890123456')
  response.success?
    # => false
  response.ok?
    # => true
  response.transaction
    # => nil
  response.text_response
    # => 'Error in request sale: missing parameters: cardexp, amount'
```

More examples can be found in the EXAMPLES.md file.

### CardAPI Methods
  - `#sale`: requires cardnum, cardexp, amount
  - `#auth`: requires cardnum, cardexp, amount
  - `#capture`: requires transid, amount
  - `#offline`: requires cardnum, cardexp, amount, authcode, authdate
  - `#balance`: requires cardnum
  - `#verify`: requires cardnum, cardexp. `amount` is automatically set to '0.00'.
  - `#passenger_sale`: requires cardnum, amount, cardexp, amount, cardexp, passengername, airportcode1, airlinecodenumber, ticketnumber, flightdatecoupon1, flightdeparturetimecoupon1, approvalcode, authcharindicator, validationcode, authresponsecode

### FiservAPI Methods
The interface for the FiservAPI is identical to the interface for the CardAPI.

### ACHAPI Methods
  - `sale`: requires bankname, routing, account, achaccounttype, achaccountsubtype, amount, firstname, lastname
  - `refund`: requires bankname, routing, account, achaccounttype, achaccountsubtype, amount
  - `credit`: requires bankname, routing, account, achaccounttype, achaccountsubtype, amount

### EcheckAPI Methods
 - `sale`: requires bankname, routing, account, achaccounttype, amount, firstname, lastname, address1, city, state, zip, country
  - `refund`: requires bankname, routing, account, achaccounttype, amount, firstname, lastname, address1, city, state, zip, country
 - `credit`: requires bankname, routing, account, achaccounttype, amount, firstname, lastname, address1, city, state, zip, country

### EwalletAPI Methods
  - `credit`: requires ewalletaccount, amount
  Please note that the EWallet API interface can only issue credits. For sales, you must use the Checkout API: The customer must be directed to the PayPal Express Checkout page where they will login to their PayPal account to pay securely.

### StarcardAPI Methods
    - `sale`: requires cardnum, :cardexp, :amount, :CID

### Data Vault Methods
These methods are for interacting with the Data Vault, and will work with any of this gem's API objects.
  - `add_customer`: requires firstname, lastname
  - `get_customer`: requires token
  - `update_customer`: requires token
  - `delete_customer`: requires token
  - `add_payment_type`: requires token, token_#, operationtype_#
  - `delete_payment_type`: requires token, token_#, operationtype_#
  - `add_plan`: requires planname, plandesc, startdate
  - `update_plan`: requires token
  - `add_sequence`: requires token, operationtype_1='addsequence', sequence_1, amount_1, scheduletype_1, scheduleday_1, duration_1
  - `assign_plan`: requires customertoken, plantoken, paymenttoken
  - `update_assignment`: requires assignmenttoken
  - `cancel_assignment`: requires assignmenttoken
  - `delete_plan`: requires token
  - `create_invoice`: requires invoicedate, currency, invoicestatus
  - `get_invoice`: requires invoicenumber
  - `update_invoice`: requires invoicenumber
  - `pay_invoice`: requires invoicenumber
  - `cancel_invoice`: requires invoicenumber, invoicestatusreason
  - `cancel_invoice_by_customer`: requires invoicenumber, invoicestatusreason
  - `decrypt`: requires fieldname, token

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
