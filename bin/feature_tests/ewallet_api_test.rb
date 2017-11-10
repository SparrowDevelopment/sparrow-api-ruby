class EwalletAPITest < SparrowOne::TestRunner
  def api
    @api ||= SparrowOne::EwalletAPI.new(TEST_KEYS[:ewallet])
  end

  def run
    puts "\neWallet Credits"
    credit_one = api.credit(ewallettype: 'PayPal', ewalletaccount: "user@example.com", amount: '7.25')
    log credit_one

    credit_two = api.credit(ewallettype: 'PayPal', ewalletaccount: "user@example.com", amount: '4.25', currency: "USD")
    log credit_two

    sale_one = api.sale(ewallettype: 'PayPal', ewalletaccount: "user@example.com", amount: '4.25', currency: "USD")
    puts "\neWallet Sale"
    log sale_one, /credit operations only/, "Expect error: eWallet handles credits only"

  end
end
