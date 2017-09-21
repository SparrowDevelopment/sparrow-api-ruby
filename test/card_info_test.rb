require "test_helper"
require 'date'
require 'test_base'

include Sparrow

class CardInfoTest < TestBase

  def test_card_data
    ci = CardInfo.new({
      :number=>'4111111111111111',
      :expiration=>DateTime.new(2010, 10, 1, 0, 0, 0),
      :cvv=>'999',
    })
    assert_equal '4111111111111111', ci.number
    assert_equal DateTime.new(2010, 10, 1, 0, 0, 0), ci.expiration
    assert_equal '999', ci.cvv
  end

  def test_card_data_hash
    ci = CardInfo.new({
      :number=>'4111111111111111',
      :expiration=>DateTime.new(2011, 10, 1, 0, 0, 0),
      :cvv=>'999',
    })
    hash = ci.to_hash
    assert_equal '4111111111111111', hash[:cardnum]
    assert_equal '1110', hash[:cardexp]
    assert_equal '999', hash[:cvv]
  end
end
