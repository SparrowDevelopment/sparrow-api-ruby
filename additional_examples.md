
SparrowOne::ACHAPI#credit
api.credit({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"1.23"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10925935", "xref"=>"3862728102", "authcode"=>"123456", "type"=>"credit", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::ACHAPI#sale
api.sale({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"1.29"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10925938", "xref"=>"3862728133", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::ACHAPI#sale
api.sale({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :company=>"Falling Man Studios", :amount=>"1.23"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10925939", "xref"=>"3862728158", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::ACHAPI#sale
api.sale({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"7.89"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10925941", "xref"=>"3862728193", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::ACHAPI#sale
api.sale({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"4.56", :company=>"Falling Man Studios"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10925942", "xref"=>"3862728218", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::ACHAPI#credit
api.credit({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"1.23", :company=>"Falling Man Studios"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10925943", "xref"=>"3862728248", "authcode"=>"123456", "type"=>"credit", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#sale
api.sale({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"1.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925944", "xref"=>"3862728272", "authcode"=>"123456", "type"=>"sale", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#sale
api.sale({:state=>"NV", :cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"2.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925945", "xref"=>"3862728331", "authcode"=>"123456", "type"=>"sale", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#refund
api.refund({:transid=>"10925944", :amount=>"1.25"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925944", "xref"=>"3862728272", "authcode"=>"123456", "type"=>"refund", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#refund
api.refund({:transid=>"10925945", :amount=>"1.00"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925945", "xref"=>"3862728331", "authcode"=>"123456", "type"=>"refund", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"3.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925947", "xref"=>"3862728446", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"4.25", :cvv=>"999", :firstname=>"Joe"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925949", "xref"=>"3862728493", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#void
api.void({:transid=>"10925947"})
 #=> {"response"=>"1", "textresponse"=>"Transaction Void Successful", "transid"=>"10925947", "xref"=>"3862728446", "authcode"=>"123456", "type"=>"void", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#void
api.void({:transid=>"10925949"})
 #=> {"response"=>"1", "textresponse"=>"Transaction Void Successful", "transid"=>"10925949", "xref"=>"3862728493", "authcode"=>"123456", "type"=>"void", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#offline
api.offline({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"5.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925950", "xref"=>"3862728665", "authcode"=>"123456", "type"=>"offline", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#offline
api.offline({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"6.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017", :firstname=>"Mark"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925951", "xref"=>"3862728725", "authcode"=>"123456", "type"=>"offline", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#credit
api.credit({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"7.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925953", "xref"=>"3862728758", "type"=>"credit", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#credit
api.credit({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"8.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017", :firstname=>"Mark"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925954", "xref"=>"3862728809", "type"=>"credit", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"9.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925955", "xref"=>"3862728871", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"10.25", :cvv=>"999", :firstname=>"Joe"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925956", "xref"=>"3862728922", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#capture
api.capture({:transid=>"10925955", :amount=>"9.25"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925955", "xref"=>"3862728871", "authcode"=>"123456", "type"=>"capture", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#capture
api.capture({:transid=>"10925956", :amount=>"3.25"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925956", "xref"=>"3862728922", "authcode"=>"123456", "type"=>"capture", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#sale
api.sale({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"111.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925957", "xref"=>"3862729085", "authcode"=>"123456", "type"=>"sale", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::CardAPI#chargeback
api.chargeback({:transid=>"10925957", :reason=>"Card reported lost"})
 #=> {"response"=>"1", "textresponse"=>"Card reported lost", "transid"=>"10925957", "xref"=>"3862729085", "authcode"=>"123456", "type"=>"chargeback", "cvvresponse"=>"M", "status"=>"200"}

SparrowOne::CardAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"19.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925958", "xref"=>"3862729156", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#sale
api.sale({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"1.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925960", "xref"=>"3862729206", "authcode"=>"123456", "type"=>"sale", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#sale
api.sale({:state=>"NV", :cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"2.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925961", "xref"=>"3862729257", "authcode"=>"123456", "type"=>"sale", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#refund
api.refund({:transid=>"10925960", :amount=>"1.25"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925960", "xref"=>"3862729206", "authcode"=>"123456", "type"=>"refund", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#refund
api.refund({:transid=>"10925961", :amount=>"1.00"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925961", "xref"=>"3862729257", "authcode"=>"123456", "type"=>"refund", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"3.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925962", "xref"=>"3862729395", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"4.25", :cvv=>"999", :firstname=>"Joe"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925963", "xref"=>"3862729457", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#void
api.void({:transid=>"10925962"})
 #=> {"response"=>"1", "textresponse"=>"Transaction Void Successful", "transid"=>"10925962", "xref"=>"3862729395", "authcode"=>"123456", "type"=>"void", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#void
api.void({:transid=>"10925963"})
 #=> {"response"=>"1", "textresponse"=>"Transaction Void Successful", "transid"=>"10925963", "xref"=>"3862729457", "authcode"=>"123456", "type"=>"void", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#offline
api.offline({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"5.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925965", "xref"=>"3862729638", "authcode"=>"123456", "type"=>"offline", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#offline
api.offline({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"6.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017", :firstname=>"Mark"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925967", "xref"=>"3862729712", "authcode"=>"123456", "type"=>"offline", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#credit
api.credit({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"7.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925968", "xref"=>"3862729747", "type"=>"credit", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#credit
api.credit({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"8.25", :cvv=>"999", :authcode=>"123456", :authdate=>"01/31/2017", :firstname=>"Mark"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925969", "xref"=>"3862729783", "type"=>"credit", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"9.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925970", "xref"=>"3862729822", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"10.25", :cvv=>"999", :firstname=>"Joe"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925972", "xref"=>"3862729883", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#capture
api.capture({:transid=>"10925970", :amount=>"9.25"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925970", "xref"=>"3862729822", "authcode"=>"123456", "type"=>"capture", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#capture
api.capture({:transid=>"10925972", :amount=>"3.25"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925972", "xref"=>"3862729883", "authcode"=>"123456", "type"=>"capture", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#sale
api.sale({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"111.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925976", "xref"=>"3862730030", "authcode"=>"123456", "type"=>"sale", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::FiservAPI#chargeback
api.chargeback({:transid=>"10925976", :reason=>"Card reported lost"})
 #=> {"response"=>"1", "textresponse"=>"Card reported lost", "transid"=>"10925976", "xref"=>"3862730030", "authcode"=>"123456", "type"=>"chargeback", "cvvresponse"=>"M", "status"=>"200"}

SparrowOne::FiservAPI#auth
api.auth({:cardnum=>"4111111111111111", :cardexp=>"1019", :amount=>"19.25", :cvv=>"999"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "transid"=>"10925979", "xref"=>"3862730118", "authcode"=>"123456", "type"=>"auth", "cvvresponse"=>"M", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::EcheckAPI#sale
api.sale({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"1.33", :transid=>"123456", :address1=>"123 Home Town", :city=>"Las Vegas", :state=>"NV", :zip=>"89108", :country=>"US"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10925981", "xref"=>"3862730192", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::EcheckAPI#sale
api.sale({:firstname=>"Mark", :lastname=>"Tabler", :bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"1.28", :transid=>"123456", :address1=>"123 Home Town", :city=>"Las Vegas", :state=>"NV", :zip=>"89108", :country=>"US"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10925982", "xref"=>"3862730221", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::EcheckAPI#sale
api.sale({:bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"7.89", :firstname=>"Mark", :lastname=>"Tabler", :address1=>"123 Home Town", :city=>"Las Vegas", :state=>"NV", :zip=>"89108", :country=>"US"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10925983", "xref"=>"3862730239", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::EcheckAPI#sale
api.sale({:bankname=>"First Test Bank", :routing=>"110000000", :account=>"1234567890123", :achaccounttype=>"checking", :achaccountsubtype=>"personal", :amount=>"4.56", :company=>"Falling Man Studios", :firstname=>"Mark", :lastname=>"Tabler", :address1=>"123 Home Town", :city=>"Las Vegas", :state=>"NV", :zip=>"89108", :country=>"US"})
 #=> {"response"=>"00", "textresponse"=>"SUCCESS", "transid"=>"10925984", "xref"=>"3862730262", "authcode"=>"123456", "type"=>"sale", "coderesponse"=>"100", "codedescription"=>"Transaction was Approved", "status"=>"200"}

SparrowOne::EwalletAPI#credit
api.credit({:ewallettype=>"PayPal", :ewalletaccount=>"user@example.com", :amount=>"7.25"})
 #=> {"response"=>"1", "textresponse"=>"Successful", "transid"=>"10925985", "xref"=>"VS3VF87TZRHM4", "type"=>"credit", "status"=>"200"}

SparrowOne::EwalletAPI#credit
api.credit({:ewallettype=>"PayPal", :ewalletaccount=>"user@example.com", :amount=>"4.25", :currency=>"USD"})
 #=> {"response"=>"1", "textresponse"=>"Successful", "transid"=>"10925987", "xref"=>"XRE2HESY86QTL", "type"=>"credit", "status"=>"200"}

SparrowOne::CardAPI#addcustomer
api.addcustomer({:firstname=>"Dude", :lastname=>"Fella", :paytype_1=>"creditcard", :cardnum_1=>"4111111111111111", :cardexp_1=>"1019"})
 #=> {"response"=>"1", "textresponse"=>"Customer with token 'XKPRH6DGWX9CJMSA' successfully created", "type"=>"addcustomer", "customertoken"=>"XKPRH6DGWX9CJMSA", "paymenttoken_1"=>"R21B5KI878451B0M"}

SparrowOne::CardAPI#addcustomer
api.addcustomer({:firstname=>"Captain", :lastname=>"Kangaroo", :paytype_1=>"ach", :bankname_1=>"Hypothetical S&L", :achaccounttype_1=>"checking", :achaccountsubtype_1=>"personal", :routing_1=>"123456789", :account_1=>"987654321"})
 #=> {"response"=>"1", "textresponse"=>"Customer with token '47CU0GUEJTC0HF2G' successfully created", "type"=>"addcustomer", "customertoken"=>"47CU0GUEJTC0HF2G", "paymenttoken_1"=>"PXXAP6P0E55HYHA3"}

SparrowOne::CardAPI#addcustomer
api.addcustomer({:firstname=>"Rhubarb", :lastname=>"McGillicutty"})
 #=> {"response"=>"1", "textresponse"=>"Customer with token 'D7PXYK7SEBSQQ89L' successfully created", "type"=>"addcustomer", "customertoken"=>"D7PXYK7SEBSQQ89L"}

SparrowOne::CardAPI#updatecustomer
api.updatecustomer({:token=>"47CU0GUEJTC0HF2G", :firstname=>"Admiral", :secret_knock=>"shave-anda-haircut"})
 #=> {"response"=>"1", "textresponse"=>"Customer with token '47CU0GUEJTC0HF2G' successfully updated", "type"=>"updatecustomer", "customertoken"=>"47CU0GUEJTC0HF2G"}

SparrowOne::CardAPI#add_payment_type
api.add_payment_type({:token=>"47CU0GUEJTC0HF2G", :operationtype_1=>"updatepaytype", :token_1=>"PXXAP6P0E55HYHA3", :achaccounttype_1=>"savings"})
 #=> {"response"=>"1", "textresponse"=>"Customer with token '47CU0GUEJTC0HF2G' successfully updated", "type"=>"updatecustomer", "customertoken"=>"47CU0GUEJTC0HF2G", "paymenttoken_1"=>"PXXAP6P0E55HYHA3"}

SparrowOne::CardAPI#get_customer
api.get_customer({:token=>"47CU0GUEJTC0HF2G"})
 #=> {"response"=>"1", "textresponse"=>"Processed", "customertoken"=>"47CU0GUEJTC0HF2G", "CustomerStatus"=>"Active", "firstname"=>"Admiral", "lastname"=>"Kangaroo", "paytype_1"=>"Ach", "payno_1"=>"1", "cardexp_1"=>"1299", "account_1"=>"*****4321", "useAccountUpdater_1"=>"False", "token_1"=>"PXXAP6P0E55HYHA3"}

SparrowOne::CardAPI#delete_payment_type
api.delete_payment_type({:token=>"47CU0GUEJTC0HF2G", :operationtype_1=>"deletepaytype", :token_1=>"PXXAP6P0E55HYHA3", :achaccounttype_1=>"savings"})
 #=> {"response"=>"1", "textresponse"=>"Customer with token '47CU0GUEJTC0HF2G' successfully updated", "type"=>"updatecustomer", "customertoken"=>"47CU0GUEJTC0HF2G", "paymenttoken_1"=>"PXXAP6P0E55HYHA3"}

SparrowOne::CardAPI#delete_customer
api.delete_customer({:token=>"47CU0GUEJTC0HF2G"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "type"=>"deletecustomer"}

SparrowOne::CardAPI#getcustomer
api.getcustomer({:token=>"47CU0GUEJTC0HF2G"})
 #=> {"response"=>"1", "textresponse"=>"Processed", "customertoken"=>"47CU0GUEJTC0HF2G", "CustomerStatus"=>"Archived", "firstname"=>"Admiral", "lastname"=>"Kangaroo"}

SparrowOne::CardAPI#add_plan
api.add_plan({:planname=>"Lease program", :plandesc=>"Kinda like rent-to-own but better", :startdate=>"01/01/2019"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "type"=>"addplan", "plantoken"=>"RQTTVK1NCQTICHPV"}

SparrowOne::CardAPI#updateplan
api.updateplan({:token=>"RQTTVK1NCQTICHPV", :plandesc=>"You get to have it while you're still buying it"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "type"=>"updateplan"}

SparrowOne::CardAPI#add_plan
api.add_plan({:planname=>"Lease program", :plandesc=>"Kinda like rent-to-own but better", :startdate=>"01/01/2019"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "type"=>"addplan", "plantoken"=>"7W9L74MG4I7421R9"}

SparrowOne::CardAPI#add_sequence
api.add_sequence({:token=>"7W9L74MG4I7421R9", :operationtype_1=>"addsequence", :sequence_1=>"1", :amount_1=>"50.00", :scheduletype_1=>"monthly", :scheduleday_1=>"7", :duration_1=>"12", :description_1=>"Bi-weekly"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "type"=>"updateplan"}

SparrowOne::CardAPI#addcustomer
api.addcustomer({:firstname=>"Dude", :lastname=>"Fella", :paytype_1=>"creditcard", :cardnum_1=>"4111111111111111", :cardexp_1=>"1019"})
 #=> {"response"=>"1", "textresponse"=>"Customer with token 'FWJ0BA83HURNVKN8' successfully created", "type"=>"addcustomer", "customertoken"=>"FWJ0BA83HURNVKN8", "paymenttoken_1"=>"O6XE2GQ7RMP4KMPC"}

SparrowOne::CardAPI#assign_plan
api.assign_plan({:customertoken=>"FWJ0BA83HURNVKN8", :plantoken=>"7W9L74MG4I7421R9", :paymenttoken=>"O6XE2GQ7RMP4KMPC", :amount=>"100.00"})
 #=> {"response"=>"1", "textresponse"=>"Success", "type"=>"assignplan", "assignmenttoken"=>"8SOKRG02FBVH0YQ6"}

SparrowOne::CardAPI#delete_plan
api.delete_plan({:token=>"RQTTVK1NCQTICHPV"})
 #=> {"response"=>"1", "textresponse"=>"SUCCESS", "type"=>"deleteplan"}

SparrowOne::CardAPI#create_invoice
api.create_invoice({:invoicedate=>"10/15/2018", :currency=>"USD", :invoiceamount=>"212.95", :invoicestatus=>"draft"})
 #=> {"textresponse"=>"invoice has been successfully created", "invoicenumber"=>"Inv-39436"}

SparrowOne::CardAPI#create_invoice
api.create_invoice({:invoicedate=>"10/15/2018", :currency=>"USD", :invoiceamount=>"101.95", :invoicestatus=>"active"})
 #=> {"textresponse"=>"invoice has been successfully created", "invoicenumber"=>"Inv-39437"}

SparrowOne::CardAPI#get_invoice
api.get_invoice({:invoicenumber=>"Inv-39436"})
 #=> {"textresponse"=>"Success", "invoicenumber"=>"Inv-39436", "invoiceamount"=>"212.9500", "currency"=>"USD", "invoicedate"=>"10/15/2018", "invoicestatus"=>"Draft"}

SparrowOne::CardAPI#update_invoice
api.update_invoice({:invoicenumber=>"Inv-39436", :invoicestatus=>"active"})
 #=> {"textresponse"=>"Invoice has been successfully updated", "invoicenumber"=>"Inv-39436"}

SparrowOne::CardAPI#pay_invoice
api.pay_invoice({:invoicenumber=>"Inv-39436", :cardnum=>"4111111111111111", :cardexp=>"1019"})
 #=> {"textresponse"=>"Invoice has been successfully paid", "transid"=>"10925991", "invoicenumber"=>"Inv-39436"}

SparrowOne::CardAPI#cancel_invoice
api.cancel_invoice({:invoicenumber=>"Inv-39437", :invoicestatusreason=>"Allergic to product"})
 #=> {"textresponse"=>"invoice has been successfully canceled", "invoicenumber"=>"Inv-39437"}
