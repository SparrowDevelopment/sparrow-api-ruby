### ACH Simple Sale

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.sale({
  bankname: 'First Test Bank',
  routing: '110000000',
  account: '1234567890123',
  achaccounttype: 'checking',
  achaccountsubtype: 'personal',
  amount: '9.95',
  firstname: 'John',
  lastname: 'Doe"',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '00'
result.textresponse # => 'SUCCESS'
result.transid # => '10934194'
result.xref # => '3865124470'
result.authcode # => '123456'
result.type # => 'sale'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### ACH Advanced Sale

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.sale({
  bankname: 'First Test Bank',
  routing: '110000000',
  account: '1234567890123',
  achaccounttype: 'checking',
  achaccountsubtype: 'personal',
  amount: '9.95',
  orderdesc: 'Order Description',
  orderid: '11111',
  firstname: 'John',
  lastname: 'Doe',
  company: 'Sparrow One',
  address1: '16100 N 71st Street',
  address2: 'Suite 170',
  city: 'Scottsdale',
  state: 'AZ',
  zip: '85254',
  country: 'US',
  phone: '7025551234',
  email: 'john@norepy.com',
  shipaddress1: '16100 N 72nd Street',
  shipaddress2: 'Suite 171',
  shipcity: 'Pheonix',
  shipstate: 'AZ',
  shipzip: '85004',
  shipcountry: 'US',
  shipphone: '6025551234',
  shipemail: 'jane@noreply.com',
  saveclient: 'true',
  updateclient: 'true',
  opt_amount_type_1: 'surcharge',
  opt_amount_value_1: '1.01',
  opt_amount_percentage_1: '18',
  birthdate: '01/31/2000',
  checknumber: '123',
  driverlicensenumber: '1234567890',
  driverlicensecountry: 'US',
  driverlicensestate: 'AZ',
  sendtransreceipttobillemail: 'true',
  sendtransreceipttoshipemail: 'true',
  paymentdescriptor: 'Custom Payment Descriptor',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '00'
result.textresponse # => 'SUCCESS, Customer with token 'LS8W4RO5S7SZKZCN' successfully updated, Payment transaction successfully assigned to the customer with token 'LS8W4RO5S7SZKZCN''
result.transid # => '10934195'
result.xref # => '3865124488'
result.authcode # => '123456'
result.orderid # => '11111'
result.type # => 'sale'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'
result.token # => 'LS8W4RO5S7SZKZCN'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Card Simple Sale

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.sale({
  amount: '9.95',
  cardnum: '4111111111111111',
  cardexp: '1010',
  cvv: '999',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.transid # => '10934196'
result.xref # => '3865124503'
result.authcode # => '123456'
result.type # => 'sale'
result.cvvresponse # => 'M'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Card Advanced Sale

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.sale({
  amount: '57.85',
  cardnum: '4111111111111111',
  cardexp: '1010',
  cvv: '999',
  skunumber_1: '5558779',
  description_1: 'menssweaterblue',
  amount_1: '50.00',
  quantity_1: '1',
  tax: '2.85',
  shipamount: '5.00',
  firstname: 'John',
  lastname: 'Smith',
  address1: '888 test address',
  city: 'Los Angeles',
  country: 'US',
  state: 'CA',
  phone: '222-444-2938',
  shipfirstname: 'John',
  shiplastname: 'Smith',
  shipaddress1: '888 test address',
  shipcity: 'Los Angeles',
  shipstate: 'CA',
  shipphone: '2224442938',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.transid # => '10934197'
result.xref # => '3865124529'
result.authcode # => '123456'
result.type # => 'sale'
result.avsresponse # => 'A'
result.cvvresponse # => 'M'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Card Simple Auth

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.auth({
  amount: '9.95',
  cardnum: '4111111111111111',
  cardexp: '1010',
  cvv: '999',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.transid # => '10934198'
result.xref # => '3865124549'
result.authcode # => '123456'
result.type # => 'auth'
result.cvvresponse # => 'M'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Card Simple Capture

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.capture({
  transid: '10934003',
  amount: '9.25',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.transid # => '10934003'
result.xref # => '3865034963'
result.authcode # => '123456'
result.type # => 'capture'
result.cvvresponse # => 'M'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Card Simple Offline Capture

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.offline({
  amount: '9.95',
  cardnum: '4111111111111111',
  cardexp: '1010',
  cvv: '999',
  authcode: '987654',
  authdate: '03/25/2016',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.transid # => '10934199'
result.xref # => '3865124571'
result.authcode # => '987654'
result.type # => 'offline'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Card Advanced Capture

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.capture({
  amount: '9.95',
  transid: '123456',
  sendtransreceipttobillemail: 'true',
  orderid: '54321',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.transid # => '123456'
result.xref # => '3865035008'
result.authcode # => '654321'
result.type # => 'capture'
result.cvvresponse # => 'M'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Card Simple Refund

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.refund({
  transid: '10933995',
  amount: '1.25',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.transid # => '10933995'
result.xref # => '3865034307'
result.authcode # => '123456'
result.type # => 'refund'
result.cvvresponse # => 'M'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Card Advanced Refund

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.refund({
  transid: '10750789',
  amount: '9.95',
  sendtransreceipttobillemail: 'true',
  sendtransreceipttoshipemail: 'true',
  sendtransreceipttoemails: 'email@email.com',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.transid # => '10750789'
result.xref # => '3829708545'
result.authcode # => '123456'
result.orderid # => ''
result.type # => 'refund'
result.avsresponse # => ''
result.cvvresponse # => 'M'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Card Simple Void

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.void({
  transid: '12345678',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'Transaction Void Successful'
result.transid # => '10750790'
result.xref # => '3829708544'
result.authcode # => '123456'
result.orderid # => ''
result.type # => 'void'
result.avsresponse # => ''
result.cvvresponse # => 'M'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Card Simple Credit

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.credit({
  cardnum: '4111111111111111',
  cardexp: '1019',
  amount: '7.25',
  cvv: '999',
  authcode: '123456',
  authdate: '01/31/2017',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.transid # => '10934200'
result.xref # => '3865124593'
result.type # => 'credit'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Card Chargeback

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.chargeback({
  transid: '10934104',
  reason: 'Card reported lost',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'Card reported lost'
result.transid # => '10934104'
result.xref # => '3865091326'
result.authcode # => '123456'
result.type # => 'chargeback'
result.cvvresponse # => 'M'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Card Passenger Sale

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.passenger_sale({
  cardnum: '4111111111111111',
  cardexp: '1019',
  amount: '9.95',
  cvv: '999',
  passengername: 'John Doe',
  stopovercode1: 'O',
  airportcode1: 'LAS',
  airportcode2: 'CDG',
  airportcode3: 'IAD',
  airportcode4: 'CPH',
  carriercoupon4: 'AA;BB',
  airlinecodenumber: 'AA0',
  ticketnumber: '1234567890',
  classofservicecoupon4: '00;AA',
  flightdatecoupon1: '01/31/2017',
  flightdeparturetimecoupon1: '23:59',
  addressverificationcode: 'A',
  approvalcode: '123456',
  transactionid: '1234567890',
  authcharindicator: 'A',
  referencenumber: '123456789012',
  validationcode: '1234',
  authresponsecode: 'AB',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.transid # => '10750803'
result.xref # => '3829708653'
result.authcode # => '123456'
result.orderid # => ''
result.type # => 'sale'
result.avsresponse # => ''
result.cvvresponse # => 'M'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Card Balance: Pending
Card Verification: Pending
Data Vault Decrypt: Pending
### Data Vault Advanced Add Customer

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.addcustomer({
  firstname: 'John',
  lastname: 'Doe',
  note: 'Customer Note',
  address1: '16100 N 71st Street',
  address2: 'Suite 170',
  city: 'Scottsdale',
  state: 'AZ',
  zip: '85254',
  country: 'US',
  email: 'john@norepy.com',
  shipfirstname: 'Jane',
  shiplastname: 'Doe',
  shipcompany: 'Sparrow Two',
  shipaddress1: '16100 N 72nd Street',
  shipaddress2: 'Suite 171',
  shipcity: 'Pheonix',
  shipstate: 'AZ',
  shipzip: '85004',
  shipcountry: 'US',
  shipphone: '6025551234',
  shipemail: 'jane@noreply.com',
  username: 'JohnDoe17101717530877',
  password: 'Password123',
  clientuseremail: 'john@norepy.com',
  paytype_1: 'creditcard',
  paytype_2: 'check',
  firstname_1: 'John',
  firstname_2: 'John',
  lastname_1: 'Doe',
  lastname_2: 'Doe',
  address1_1: '123 Main Street',
  address1_2: '321 1st Street',
  address2_1: 'Suite 1',
  address2_2: 'Suite 2',
  city_1: 'Pheonix',
  city_2: 'Scottsdale',
  state_1: 'AZ',
  state_2: 'AZ',
  zip_1: '85111',
  zip_2: '85222',
  country_1: 'US',
  country_2: 'US',
  phone_1: '6025551234',
  phone_2: '6025554321',
  email_1: 'john@norepy.com',
  email_2: 'jane@noreploy.com',
  cardnum_1: '4111111111111111',
  cardnum_2: '4111111111111111',
  cardexp_1: '1019',
  cardexp_2: '1019',
  bankname_1: '',
  bankname_2: 'First Test Bank',
  routing_1: '',
  routing_2: '110000000',
  account_1: '',
  account_2: '1234567890123',
  achaccounttype_1: '',
  achaccounttype_2: 'personal',
  payno_1: '1',
  payno_2: '2',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'User with this name already exists. Please choose another name.'
result.type # => 'addcustomer'
result.customertoken # => 'F6OE0IN0I5HSV6AJ'
result.paymenttoken_1 # => 'UL1T9MMP0T3B2EQD'
result.paymenttoken_2 # => '1BQEWD81VTKZH6QI'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Simple Add Customer (With Card)

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.addcustomer({
  firstname: 'John',
  lastname: 'Doe',
  paytype_1: 'creditcard',
  cardnum_1: '4111111111111111',
  cardexp_1: '0220',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'Customer with token 'QR1KKWVQEF2CDEJB' successfully created'
result.type # => 'addcustomer'
result.customertoken # => 'QR1KKWVQEF2CDEJB'
result.paymenttoken_1 # => 'UF7IBSWT7R6AUNPK'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Simple Add Customer (With Star Card)

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.addcustomer({
  firstname: 'John',
  lastname: 'Doe',
  paytype_1: 'starcard',
  cardnum_1: '6019440000011111',
  CID: '52347800001',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'Customer with token '2CGIRCV0DYY3JZEU' successfully created'
result.type # => 'addcustomer'
result.customertoken # => '2CGIRCV0DYY3JZEU'
result.paymenttoken_1 # => 'SQJJX5PQN98PCWH4'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Simple Add Customer (With Ewallet)

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.addcustomer({
  firstname: 'John',
  lastname: 'Doe',
  paytype_1: 'ewallet',
  ewallettype_1: 'paypal',
  ewalletaccount_1: 'email@email.com',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'Customer with token 'SSMNLRTJ7W1VXPB2' successfully created'
result.type # => 'addcustomer'
result.customertoken # => 'SSMNLRTJ7W1VXPB2'
result.paymenttoken_1 # => '2E2U28P74IM2ZV61'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Update Customer

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.updatecustomer({
  token: 'B31388EA20ABF2776C93',
  address1: '939 St. Winnie’s st.',
  city: 'Forest City',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'Customer with token 'O3BEZTT2UHCS7USA' successfully updated'
result.type # => 'updatecustomer'
result.customertoken # => 'O3BEZTT2UHCS7USA'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Add Payment Plan

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.add_plan({
  planname: 'Example Plan Name',
  plandesc: 'Example Plan Description',
  startdate: '01/01/2019',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.type # => 'addplan'
result.plantoken # => 'ZSTU150DWYLP0A5S'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Update Payment Plan

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.updateplan({
  token: 'R40XPOWL4U274RAH',
  plandesc: 'Example Plan Description',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.type # => 'updateplan'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Add Payment Plan Sequence

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.add_sequence({
  token: 'R40XPOWL4U274RAH',
  operationtype_1: 'addsequence',
  sequence_1: '1',
  amount_1: '50.00',
  scheduletype_1: 'monthly',
  scheduleday_1: '7',
  duration_1: '12',
  description_1: 'Bi-weekly',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.type # => 'updateplan'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Assign Payment Plan

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.assign_plan({
  customertoken: 'CVJZ7HWZQZB7PFS5',
  plantoken: 'R40XPOWL4U274RAH',
  paymenttoken: 'PZH0WHV6X05RDFYQ',
  amount: '100.00',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'Success'
result.type # => 'assignplan'
result.assignmenttoken # => 'RCAMPQH5ANCHLEVK'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Delete Payment Plan

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.delete_plan({
  token: 'R40XPOWL4U274RAH',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.type # => 'deleteplan'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Delete Payment Type

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.delete_payment_type({
  token: 'CVJZ7HWZQZB7PFS5',
  operationtype_1: 'deletepaytype',
  token_1: 'PZH0WHV6X05RDFYQ',
  achaccounttype_1: 'savings',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'Customer with token 'CVJZ7HWZQZB7PFS5' successfully updated'
result.type # => 'updatecustomer'
result.customertoken # => 'CVJZ7HWZQZB7PFS5'
result.paymenttoken_1 # => 'PZH0WHV6X05RDFYQ'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Delete Customer

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.delete_customer({
  token: 'CVJZ7HWZQZB7PFS5',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.type # => 'deletecustomer'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Create Invoice

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.create_invoice({
  invoicedate: '10/15/2018',
  currency: 'USD',
  invoiceamount: '212.95',
  invoicestatus: 'draft',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.textresponse # => 'invoice has been successfully created'
result.invoicenumber # => 'Inv-39569'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Get Invoice

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.get_invoice({
  invoicenumber: 'Inv-39570',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.textresponse # => 'Success'
result.invoicenumber # => 'Inv-39570'
result.invoiceamount # => '212.9500'
result.currency # => 'USD'
result.invoicedate # => '10/15/2018'
result.invoicestatus # => 'Draft'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Update Invoice

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.update_invoice({
  invoicenumber: 'Inv-39570',
  invoicestatus: 'active',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.textresponse # => 'Invoice has been successfully updated'
result.invoicenumber # => 'Inv-39570'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Pay Invoice

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.pay_invoice({
  invoicenumber: 'Inv-39570',
  cardnum: '4111111111111111',
  cardexp: '1019',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.textresponse # => 'Invoice has been successfully paid'
result.transid # => '10934201'
result.invoicenumber # => 'Inv-39570'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Cancel Invoice

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.cancel_invoice({
  invoicenumber: 'Inv-39571',
  invoicestatusreason: 'Customer allergic to product',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.textresponse # => 'invoice has been successfully canceled'
result.invoicenumber # => 'Inv-39571'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Echeck Simple Sale

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.sale({
  amount: '9.95',
  bankname: 'BankofAmerica',
  routing: '110000000',
  account: '1234567890123',
  achaccounttype: 'checking',
  achaccountsubtype: 'business',
  company: 'CompanyName',
  firstname: 'Henry',
  lastname: 'Johnson',
  address1: 'Main Street 45',
  city: 'Scottsdale',
  zip: '12345',
  country: 'US',
  state: 'AZ',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '00'
result.textresponse # => 'SUCCESS'
result.transid # => '10934202'
result.xref # => '3865124683'
result.authcode # => '123456'
result.type # => 'sale'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Echeck Advanced Sale

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.sale({
  amount: '9.95',
  bankname: 'BankofAmerica',
  routing: '110000000',
  account: '1234567890123',
  achaccounttype: 'checking',
  achaccountsubtype: 'business',
  company: 'CompanyName',
  firstname: 'Henry',
  lastname: 'Johnson',
  address1: 'Main Street 45',
  city: 'Scottsdale',
  zip: '12345',
  country: 'US',
  state: 'AZ',
  phone: '8526547896',
  email: 'hjohnson@test.com',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '00'
result.textresponse # => 'SUCCESS'
result.transid # => '10934203'
result.xref # => '3865124693'
result.authcode # => '123456'
result.type # => 'sale'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

