require "test_helper"
require 'date'

include Sparrow

class SparrowSimpleSaleTest < Minitest::Test
  def setup
    @env = {}
    ENV.each do |k, v|
      @env[k] = v
    end
  end
  
  def teardown
    ENV.each do |k, v|
      if(!@env.has_key?(k))
        ENV.delete(k)
      end
    end
    @env.each do |k,v|
      ENV[k] = @env[k]
    end
  end

  def test_simple_sale_invalid_key
    c = Connection.new :mkey=>'123'
    ci = CardInfo.new({
      :number=>'4111111111111111',
      :expiration=>DateTime.new(2010, 10, 1, 0, 0, 0),
      :cvv=>'999',
    })
    res = c.simple_sale(9.95, ci)
    assert_equal 1, res.response
    assert_true res.trans_id.is_a? String
    assert_true 'sale', res.type
  end

  
  def test_simple_sale
    c = Connection.new
    ci = CardInfo.new({
      :number=>'4111111111111111',
      :expiration=>DateTime.new(2010, 10, 1, 0, 0, 0),
      :cvv=>'999',
    })
    res = c.simple_sale(9.95, ci)
    assert_equal 1, res.response
    assert_true res.trans_id.is_a? String
    assert_true 'sale', res.type
  end

end
