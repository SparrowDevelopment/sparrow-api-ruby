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
result.transid # => '10934180'
result.xref # => '3865117153'
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
result.transid # => '10934181'
result.xref # => '3865117170'
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
result.transid # => '10934182'
result.xref # => '3865117200'
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
result.transid # => '10934183'
result.xref # => '3865117234'
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
result.transid # => '10934184'
result.xref # => '3865117259'
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
result.transid # => '10934185'
result.xref # => '3865117275'
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
result.transid # => '10934186'
result.xref # => '3865117305'
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
result.paymenttoken_1 # => 'CPDFXJGSIZ5AL1WZ'
result.paymenttoken_2 # => '3KDG1KFL69CE08N0'

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
result.textresponse # => 'Customer with token '4UYWY04RYLHK2CKJ' successfully created'
result.type # => 'addcustomer'
result.customertoken # => '4UYWY04RYLHK2CKJ'
result.paymenttoken_1 # => 'G3HKZYT8W551Z5QY'

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
result.textresponse # => 'Customer with token '1A88HBMOK6V605GT' successfully created'
result.type # => 'addcustomer'
result.customertoken # => '1A88HBMOK6V605GT'
result.paymenttoken_1 # => 'KHVXSV22K1IYHC1J'

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
result.textresponse # => 'Customer with token 'H5L32C7FEM931FPO' successfully created'
result.type # => 'addcustomer'
result.customertoken # => 'H5L32C7FEM931FPO'
result.paymenttoken_1 # => '9PV3C00FAZ925C13'

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
result.plantoken # => '5TD61QRE6CGNZ0HR'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Update Payment Plan

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.updateplan({
  token: 'FLUVX5ZWY4Z3Z6CA',
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
  token: 'FLUVX5ZWY4Z3Z6CA',
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
  customertoken: 'MFIK3XS18Z55ZJVA',
  plantoken: 'FLUVX5ZWY4Z3Z6CA',
  paymenttoken: '3T4TNZHGIGYP3YHH',
  amount: '100.00',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'Success'
result.type # => 'assignplan'
result.assignmenttoken # => 'GH4XIH6W7CCW9D8J'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Delete Payment Plan

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.delete_plan({
  token: 'FLUVX5ZWY4Z3Z6CA',
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
  token: 'MFIK3XS18Z55ZJVA',
  operationtype_1: 'deletepaytype',
  token_1: '3T4TNZHGIGYP3YHH',
  achaccounttype_1: 'savings',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'Customer with token 'MFIK3XS18Z55ZJVA' successfully updated'
result.type # => 'updatecustomer'
result.customertoken # => 'MFIK3XS18Z55ZJVA'
result.paymenttoken_1 # => '3T4TNZHGIGYP3YHH'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Delete Customer

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.delete_customer({
  token: 'MFIK3XS18Z55ZJVA',
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
result.invoicenumber # => 'Inv-39566'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Get Invoice

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.get_invoice({
  invoicenumber: 'Inv-39567',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.textresponse # => 'Success'
result.invoicenumber # => 'Inv-39567'
result.invoiceamount # => '212.9500'
result.currency # => 'USD'
result.invoicedate # => '10/15/2018'
result.invoicestatus # => 'Draft'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Update Invoice

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.update_invoice({
  invoicenumber: 'Inv-39567',
  invoicestatus: 'active',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.textresponse # => 'Invoice has been successfully updated'
result.invoicenumber # => 'Inv-39567'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Pay Invoice

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.pay_invoice({
  invoicenumber: 'Inv-39567',
  cardnum: '4111111111111111',
  cardexp: '1019',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.textresponse # => 'Invoice has been successfully paid'
result.transid # => '10934187'
result.invoicenumber # => 'Inv-39567'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Data Vault Cancel Invoice

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.cancel_invoice({
  invoicenumber: 'Inv-39568',
  invoicestatusreason: 'Customer allergic to product',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.textresponse # => 'invoice has been successfully canceled'
result.invoicenumber # => 'Inv-39568'

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
result.transid # => '10934188'
result.xref # => '3865117428'
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
result.transid # => '10934189'
result.xref # => '3865117441'
result.authcode # => '123456'
result.type # => 'sale'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Ewallet Simple Credit

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.credit({
  ewalletaccount: 'user@example.com',
  ewallet_type: 'PayPal',
  amount: '9.95',
  currency: 'USD',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'Successful'
result.transid # => '10934190'
result.xref # => 'XTCFKEWCELK9A'
result.type # => 'credit'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Fiserv Simple Sale

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.sale({
  cardnum: '4111111111111111',
  cardexp: '1019',
  amount: '9.95',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.transid # => '10934191'
result.xref # => '3865117552'
result.authcode # => '123456'
result.type # => 'sale'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Fiserv Advanced Sale

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.sale({
  cardnum: '4111111111111111',
  cardexp: '1019',
  amount: '9.95',
  cvv: '999',
  currency: 'USD',
  firstname: 'John',
  lastname: 'Doe',
  skunumber_1: '123',
  skunumber_2: '456',
  description_1: 'Blue widget',
  description_2: 'Brown widget',
  amount_1: '1.99',
  amount_2: '2.99',
  quantity_1: '1',
  quantity_2: '2',
  orderdesc: 'Order Description',
  orderid: '11111',
  cardipaddress: '8.8.8.8',
  tax: '0.25',
  shipamount: '1.25',
  ponumber: '22222',
  company: 'Sparrow One',
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
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.transid # => '10934192'
result.xref # => '3865117579'
result.authcode # => '123456'
result.orderid # => '11111'
result.type # => 'sale'
result.avsresponse # => 'N'
result.cvvresponse # => 'M'
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Star Card Simple Sale

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.sale({
  cardnum: '6019440000011111',
  amount: '20.00',
  CID: '52347800001',
})
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

RESULT:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

result.response # => '1'
result.textresponse # => 'SUCCESS'
result.transid # => '10750791'
result.xref # => '3829708548'
result.authcode # => '123456'
result.orderid # => ''
result.type # => 'sale'
result.avsresponse # => ''
result.cvvresponse # => ''
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Star Card Advanced Sale

CODE:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
api.sale({
  amount: '57.85',
  cardnum: '6019440000011111',
  CID: '12345678911',
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
result.transid # => '10750808'
result.xref # => '3829708587'
result.authcode # => '123456'
result.orderid # => '11111'
result.type # => 'sale'
result.avsresponse # => 'N'
result.cvvresponse # => ''
result.coderesponse # => '100'
result.codedescription # => 'Transaction was Approved'
result.status # => '200'

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

