require 'test_helper'

require File.join(File.dirname(__FILE__), 'mock_model')

class CurrencyMagicTest < ActiveSupport::TestCase

  test "should have currency magic" do
    m = MockModel.new

    m.price = 149
    assert_equal 149, m.price
    assert_equal 1.49, m.price_dollars

    m.price = 151
    assert_equal 151, m.price
    assert_equal 1.51, m.price_dollars

    m.price_dollars = 2.49
    assert_equal 249, m.price
    assert_equal 2.49, m.price_dollars

    m.price_dollars = 2.51
    assert_equal 251, m.price
    assert_equal 2.51, m.price_dollars

    m.price_dollars = '3.49'
    assert_equal 349, m.price

    m.price_dollars = '3.51'
    assert_equal 351, m.price

    m.price_dollars = '$4.49'
    assert_equal 449, m.price

    m.price_dollars = '$4.51'
    assert_equal 451, m.price

    m.price_dollars = '5.49$'
    assert_equal 549, m.price

    m.price_dollars = '5.51$'
    assert_equal 551, m.price

    assert m.respond_to?(:price_dollars)
    assert m.respond_to?(:price_dollars=)
  end
end
