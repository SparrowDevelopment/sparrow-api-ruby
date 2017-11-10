class EwalletAPITest < SparrowOne::TestRunner
  def api
    @api ||= SparrowOne::EwalletAPI.new(TEST_KEYS[:ewallet])
  end

  def run
    puts "\neWallet Credits"
    credit_one = specify(:credit, { ewallettype: 'PayPal', ewalletaccount: "user@example.com", amount: '7.25' })

    credit_two = specify(:credit, { ewallettype: 'PayPal', ewalletaccount: "user@example.com", amount: '4.25', currency: "USD" })

    sale_one = specify(:sale, { ewallettype: 'PayPal', ewalletaccount: "user@example.com", amount: '4.25', currency: "USD" })
    puts "\neWallet Sale"

  end
end
