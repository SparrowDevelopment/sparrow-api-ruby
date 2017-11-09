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

### CardAPI Methods
  - `#sale`: requires cardnum, cardexp, amount
  - `#auth`: requires cardnum, cardexp, amount
  - `#capture`: requires transid, amount
  - `#offline`: requires cardnum, cardexp, amount, authcode, authdate
  - `#balance`: requires cardnum
  - `#verify`: requires cardnum, cardexp. `amount` is automatically set to '0.00'.
  - `#passenger_sale`: requires cardnum, amount, cardexp, amount, cardexp, passengername, airportcode1, airlinecodenumber, ticketnumber, flightdatecoupon1, flightdeparturetimecoupon1, approvalcode, authcharindicator, validationcode, authresponsecode

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
