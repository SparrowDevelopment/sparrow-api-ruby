require "test_helper"
require 'date'
require 'test_base'
require 'pp'

include Sparrow

class SimpleSaleTest < TestBase
  def test_simple_sale_invalid_key
    c = Connection.new :mkey=>'123'
    ci = CardInfo.new({
      :number=>'4111111111111111',
      :expiration=>DateTime.new(2010, 10, 1, 0, 0, 0),
      :cvv=>'999',
    })
    res = c.simple_sale(9.95, ci)
    assert_equal 3, res[:response]
  end

  
  def test_simple_sale
    c = Connection.new
    ci = CardInfo.new({
      :number=>'4111111111111111',
      :expiration=>DateTime.new(2010, 10, 1, 0, 0, 0),
      :cvv=>'999',
    })
    res = c.simple_sale(9.95, ci)
    assert_equal 1, res[:response]
    assert res[:transid].is_a? String
    assert_equal 'sale', res[:type]
  end

end
