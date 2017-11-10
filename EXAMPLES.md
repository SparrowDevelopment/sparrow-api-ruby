SparrowOne::ACHAPI#credit
api.credit({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"1.23"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10922942", "xref"=>"3861722594", "authcode"=>"123456", "type"=>"credit", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::ACHAPI#sale
api.sale({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"1.29"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10922943", "xref"=>"3861722620", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::ACHAPI#sale
api.sale({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :company=>"Falling Man Studios", :amount=>"1.23"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10922944", "xref"=>"3861722637", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::ACHAPI#sale
api.sale({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"7.89"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10922945", "xref"=>"3861722657", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::ACHAPI#sale
api.sale({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"4.56", :company=>"Falling Man Studios"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10922946", "xref"=>"3861722677", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::ACHAPI#credit
api.credit({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"1.23", :company=>"Falling Man Studios"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10922947", "xref"=>"3861722691", "authcode"=>"123456", "type"=>"credit", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#sale
api.sale({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"1.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922948", "xref"=>"3861722720", "authcode"=>"123456", "type"=>"sale", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#sale
api.sale({:state=>"NV", :cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"2.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922949", "xref"=>"3861722769", "authcode"=>"123456", "type"=>"sale", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#refund
api.refund({:transid=>"10922948", :amount=>"1.25"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922948", "xref"=>"3861722720", "authcode"=>"123456", "type"=>"refund", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#refund
api.refund({:transid=>"10922949", :amount=>"1.00"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922949", "xref"=>"3861722769", "authcode"=>"123456", "type"=>"refund", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"3.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922950", "xref"=>"3861722862", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"4.25", :cvv=>"999", :firstname=>"Joe"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922951", "xref"=>"3861722880", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#void
api.void({:transid=>"10922950"})
 #=> {"response"=>"1", "textresponse"=>"Transaction Void Successful", "transid"=>"10922950", "xref"=>"3861722862", "authcode"=>"123456", "type"=>"void", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#void
api.void({:transid=>"10922951"})
 #=> {"response"=>"1", "textresponse"=>"Transaction Void Successful", "transid"=>"10922951", "xref"=>"3861722880", "authcode"=>"123456", "type"=>"void", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#offline
api.offline({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"5.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922952", "xref"=>"3861722960", "authcode"=>"123456", "type"=>"offline", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#offline
api.offline({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"6.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017", :firstname=>"Mark"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922953", "xref"=>"3861722984", "authcode"=>"123456", "type"=>"offline", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#credit
api.credit({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"7.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922954", "xref"=>"3861723018", "type"=>"credit", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#credit
api.credit({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"8.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017", :firstname=>"Mark"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922955", "xref"=>"3861723055", "type"=>"credit", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"9.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922956", "xref"=>"3861723078", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"10.25", :cvv=>"999", :firstname=>"Joe"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922957", "xref"=>"3861723099", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#capture
api.capture({:transid=>"10922956", :amount=>"9.25"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922956", "xref"=>"3861723078", "authcode"=>"123456", "type"=>"capture", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#capture
api.capture({:transid=>"10922957", :amount=>"3.25"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922957", "xref"=>"3861723099", "authcode"=>"123456", "type"=>"capture", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#sale
api.sale({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"111.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922958", "xref"=>"3861723192", "authcode"=>"123456", "type"=>"sale", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#chargeback
api.chargeback({:transid=>"10922958", :reason=>"Card reported lost"})
 #=> {"response"=>"1", "textresponse"=>"Card reported lost", "transid"=>"10922958", "xref"=>"3861723192", "authcode"=>"123456", "type"=>"chargeback", "cvvresponse"=>"M", "status"=>"200"}

SparrowOne::CardAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"19.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922959", "xref"=>"3861723222", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#sale
api.sale({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"1.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922960", "xref"=>"3861723251", "authcode"=>"123456", "type"=>"sale", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#sale
api.sale({:state=>"NV", :cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"2.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922961", "xref"=>"3861723277", "authcode"=>"123456", "type"=>"sale", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#refund
api.refund({:transid=>"10922960", :amount=>"1.25"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922960", "xref"=>"3861723251", "authcode"=>"123456", "type"=>"refund", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#refund
api.refund({:transid=>"10922961", :amount=>"1.00"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922961", "xref"=>"3861723277", "authcode"=>"123456", "type"=>"refund", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"3.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922962", "xref"=>"3861723367", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"4.25", :cvv=>"999", :firstname=>"Joe"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922963", "xref"=>"3861723414", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#void
api.void({:transid=>"10922962"})
 #=> {"response"=>"1", "textresponse"=>"Transaction Void Successful", "transid"=>"10922962", "xref"=>"3861723367", "authcode"=>"123456", "type"=>"void", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#void
api.void({:transid=>"10922963"})
 #=> {"response"=>"1", "textresponse"=>"Transaction Void Successful", "transid"=>"10922963", "xref"=>"3861723414", "authcode"=>"123456", "type"=>"void", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#offline
api.offline({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"5.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922964", "xref"=>"3861723515", "authcode"=>"123456", "type"=>"offline", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#offline
api.offline({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"6.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017", :firstname=>"Mark"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922965", "xref"=>"3861723540", "authcode"=>"123456", "type"=>"offline", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#credit
api.credit({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"7.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922966", "xref"=>"3861723573", "type"=>"credit", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#credit
api.credit({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"8.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017", :firstname=>"Mark"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922967", "xref"=>"3861723597", "type"=>"credit", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"9.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922968", "xref"=>"3861723632", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"10.25", :cvv=>"999", :firstname=>"Joe"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922969", "xref"=>"3861723671", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#capture
api.capture({:transid=>"10922968", :amount=>"9.25"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922968", "xref"=>"3861723632", "authcode"=>"123456", "type"=>"capture", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#capture
api.capture({:transid=>"10922969", :amount=>"3.25"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922969", "xref"=>"3861723671", "authcode"=>"123456", "type"=>"capture", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#sale
api.sale({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"111.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922970", "xref"=>"3861723742", "authcode"=>"123456", "type"=>"sale", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#chargeback
api.chargeback({:transid=>"10922970", :reason=>"Card reported lost"})
 #=> {"response"=>"1", "textresponse"=>"Card reported lost", "transid"=>"10922970", "xref"=>"3861723742", "authcode"=>"123456", "type"=>"chargeback", "cvvresponse"=>"M", "status"=>"200"}

SparrowOne::FiservAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"19.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10922971", "xref"=>"3861723788", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::EcheckAPI#sale
api.sale({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"1.33", :transid=>"123456", :address1=>"123 Home Town", :city=>"Las Vegas", :state=>"NV", :zip=>"89108", :country=>"US"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10922972", "xref"=>"3861723831", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::EcheckAPI#sale
api.sale({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"1.28", :transid=>"123456", :address1=>"123 Home Town", :city=>"Las Vegas", :state=>"NV", :zip=>"89108", :country=>"US"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10922973", "xref"=>"3861723852", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::EcheckAPI#sale
api.sale({:bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"7.89", :firstname=>"Mark", :lastname=>"Tabler", :address1=>"123 Home Town", :city=>"Las Vegas", :state=>"NV", :zip=>"89108", :country=>"US"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10922974", "xref"=>"3861723868", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::EcheckAPI#sale
api.sale({:bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"4.56", :company=>"Falling Man Studios", :firstname=>"Mark", :lastname=>"Tabler", :address1=>"123 Home Town", :city=>"Las Vegas", :state=>"NV", :zip=>"89108", :country=>"US"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10922975", "xref"=>"3861723876", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::EwalletAPI#credit
api.credit({:ewallettype=>"PayPal", :ewalletaccount=>"user@example.com", :amount=>"7.25"})
 #=> {"response"=>"1", "textresponse"=>"Successful", "transid"=>"10922976", "xref"=>"38HL9K787HXQY", "type"=>"credit", "status"=>"200"}

SparrowOne::EwalletAPI#credit
api.credit({:ewallettype=>"PayPal", :ewalletaccount=>"user@example.com", :amount=>"4.25", :currency=>"USD"})
 #=> {"response"=>"1", "textresponse"=>"Successful", "transid"=>"10922977", "xref"=>"AYB2YB49YG6F4", "type"=>"credit", "status"=>"200"}

Star Card Sales:

SparrowOne::CardAPI#addcustomer
api.addcustomer({:firstname=>"Dude", :lastname=>"Fella", :paytype_1=>"creditcard", :cardnum_1=>"4111111111111111", :cardexp_1=>"1019"})
 #=> {"response"=>"1", "textresponse"=>"Customer with token '5IUWX06YY9J3YZW5' successfully created", "type"=>"addcustomer", "customertoken"=>"5IUWX06YY9J3YZW5", "paymenttoken_1"=>"6YXGSV84K0ESB4VJ"}

SparrowOne::CardAPI#addcustomer
api.addcustomer({:firstname=>"Captain", :lastname=>"Kangaroo", :paytype_1=>"ach", :bankname_1=>"Hypothetical S&L", :achaccounttype_1=>"checking", :achaccountsubtype_1=>"personal", :routing_1=>"123456789", :account_1=>"987654321"})
 #=> {"response"=>"1", "textresponse"=>"Customer with token 'K5XJ3AJ9SFVV7NX3' successfully created", "type"=>"addcustomer", "customertoken"=>"K5XJ3AJ9SFVV7NX3", "paymenttoken_1"=>"LXGY8HODCR0T0U7M"}

SparrowOne::CardAPI#addcustomer
api.addcustomer({:firstname=>"Rhubarb", :lastname=>"McGillicutty"})
 #=> {"response"=>"1", "textresponse"=>"Customer with token 'KCC4IQ7XV8TAD9QX' successfully created", "type"=>"addcustomer", "customertoken"=>"KCC4IQ7XV8TAD9QX"}

SparrowOne::CardAPI#updatecustomer
api.updatecustomer({:token=>"K5XJ3AJ9SFVV7NX3", :firstname=>"Admiral", :secret_knock=>"shave-anda-haircut"})
 #=> {"response"=>"1", "textresponse"=>"Customer with token 'K5XJ3AJ9SFVV7NX3' successfully updated", "type"=>"updatecustomer", "customertoken"=>"K5XJ3AJ9SFVV7NX3"}

SparrowOne::CardAPI#add_payment_type
api.add_payment_type({:token=>"K5XJ3AJ9SFVV7NX3", :operationtype_1=>"updatepaytype", :token_1=>"LXGY8HODCR0T0U7M", :achaccounttype_1=>"savings"})
 #=> {"response"=>"1", "textresponse"=>"Customer with token 'K5XJ3AJ9SFVV7NX3' successfully updated", "type"=>"updatecustomer", "customertoken"=>"K5XJ3AJ9SFVV7NX3", "paymenttoken_1"=>"LXGY8HODCR0T0U7M"}

SparrowOne::CardAPI#get_customer
api.get_customer({:token=>"K5XJ3AJ9SFVV7NX3"})
 #=> {"response"=>"1", "textresponse"=>"Processed", "customertoken"=>"K5XJ3AJ9SFVV7NX3", "CustomerStatus"=>"Active", "firstname"=>"Admiral", "lastname"=>"Kangaroo", "paytype_1"=>"Ach", "payno_1"=>"1", "cardexp_1"=>"1299", "account_1"=>"*****4321", "useAccountUpdater_1"=>"False", "token_1"=>"LXGY8HODCR0T0U7M"}

SparrowOne::CardAPI#delete_payment_type
api.delete_payment_type({:token=>"K5XJ3AJ9SFVV7NX3", :operationtype_1=>"deletepaytype", :token_1=>"LXGY8HODCR0T0U7M", :achaccounttype_1=>"savings"})
 #=> {"response"=>"1", "textresponse"=>"Customer with token 'K5XJ3AJ9SFVV7NX3' successfully updated", "type"=>"updatecustomer", "customertoken"=>"K5XJ3AJ9SFVV7NX3", "paymenttoken_1"=>"LXGY8HODCR0T0U7M"}

SparrowOne::CardAPI#delete_customer
api.delete_customer({:token=>"K5XJ3AJ9SFVV7NX3"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "type"=>"deletecustomer"}

SparrowOne::CardAPI#getcustomer
api.getcustomer({:token=>"K5XJ3AJ9SFVV7NX3"})
 #=> {"response"=>"1", "textresponse"=>"Processed", "customertoken"=>"K5XJ3AJ9SFVV7NX3", "CustomerStatus"=>"Archived", "firstname"=>"Admiral", "lastname"=>"Kangaroo"}

SparrowOne::CardAPI#add_plan
api.add_plan({:planname=>"Lease program", :plandesc=>"Kinda like rent-to-own but better", :startdate=>"01/01/2019"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "type"=>"addplan", "plantoken"=>"GKGG37821NAWHRQ8"}

SparrowOne::CardAPI#add_plan
api.add_plan({:planname=>"Lease program", :plandesc=>"Kinda like rent-to-own but better", :startdate=>"01/01/2019"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "type"=>"addplan", "plantoken"=>"S53IPDGJK0M7VOX3"}

SparrowOne::CardAPI#updateplan
api.updateplan({:token=>"GKGG37821NAWHRQ8", :plandesc=>"You get to have it while you're still buying it"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "type"=>"updateplan"}

SparrowOne::CardAPI#add_sequence
api.add_sequence({:token=>"S53IPDGJK0M7VOX3", :operationtype_1=>"addsequence", :operationtype_2=>"addsequence", :sequence_1=>"1", :sequence_2=>"2", :amount_1=>"50", :amount_2=>"100", :scheduletype_1=>"custom", :scheduletype_2=>"monthly", :scheduleday_1=>"7", :scheduleday_2=>"1", :duration_1=>"52", :duration_2=>"26", :productid_1=>"abc", :productid_2=>"def", :description_1=>"Bi-weekly", :description_2=>"Monthly"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "type"=>"updateplan"}

SparrowOne::CardAPI#delete_plan
api.delete_plan({:token=>"GKGG37821NAWHRQ8"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "type"=>"deleteplan"}

SparrowOne::CardAPI#addcustomer
api.addcustomer({:firstname=>"Dude", :lastname=>"Fella", :paytype_1=>"creditcard", :cardnum_1=>"4111111111111111", :cardexp_1=>"1019"})
 #=> {"response"=>"1", "textresponse"=>"Customer with token 'N9SWX2WP19UTC70L' successfully created", "type"=>"addcustomer", "customertoken"=>"N9SWX2WP19UTC70L", "paymenttoken_1"=>"JRAGBN4H53URE9BH"}

SparrowOne::CardAPI#create_invoice
api.create_invoice({:invoicedate=>"10/15/2018", :currency=>"USD", :invoiceamount=>"212.95", :invoicestatus=>"draft"})
 #=> {"textresponse"=>"invoice has been successfully created", "invoicenumber"=>"Inv-39368"}

SparrowOne::CardAPI#create_invoice
api.create_invoice({:invoicedate=>"10/15/2018", :currency=>"USD", :invoiceamount=>"101.95", :invoicestatus=>"active"})
 #=> {"textresponse"=>"invoice has been successfully created", "invoicenumber"=>"Inv-39369"}

SparrowOne::CardAPI#get_invoice
api.get_invoice({:invoicenumber=>"Inv-39368"})
 #=> {"textresponse"=>"Success", "invoicenumber"=>"Inv-39368", "invoiceamount"=>"212.9500", "currency"=>"USD", "invoicedate"=>"10/15/2018", "invoicestatus"=>"Draft"}

SparrowOne::CardAPI#update_invoice
api.update_invoice({:invoicenumber=>"Inv-39368", :invoicestatus=>"active"})
 #=> {"textresponse"=>"Invoice has been successfully updated", "invoicenumber"=>"Inv-39368"}

SparrowOne::CardAPI#pay_invoice
api.pay_invoice({:invoicenumber=>"Inv-39368", :cardnum=>"4111111111111111", :cardexp=>"1019"})
 #=> {"textresponse"=>"Invoice has been successfully paid", "transid"=>"10922978", "invoicenumber"=>"Inv-39368"}

SparrowOne::CardAPI#cancel_invoice
api.cancel_invoice({:invoicenumber=>"Inv-39369", :invoicestatusreason=>"Allergic to product"})
 #=> {"textresponse"=>"invoice has been successfully canceled", "invoicenumber"=>"Inv-39369"}
