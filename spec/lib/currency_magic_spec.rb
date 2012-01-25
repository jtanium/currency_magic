require 'spec_helper'
require 'currency_magic'

describe CurrencyMagic do

  include CurrencyMagic

  describe "#currency_to_f" do
    it "should convert a string to a float" do

      currency_to_f(149).should eq(149.0)
      currency_to_f(151).should eq(151.0)

      currency_to_f(2.49).should eq(2.49)
      currency_to_f(2.51).should eq(2.51)

      currency_to_f('3.49').should eq(3.49)
      currency_to_f('3.51').should eq(3.51)

      currency_to_f('$4.49').should eq(4.49)
      currency_to_f('$4.51').should eq(4.51)

      currency_to_f('5.49$').should eq(5.49)
      currency_to_f('5.51$').should eq(5.51)
    end
    context "when currency is nil" do
      it("should return nil") { currency_to_f(nil).should be_nil }
    end
  end

  describe "#to_cents" do
    it "should multiply by 100 and round" do
      to_cents(6.49).should eq(649)
      to_cents(6.51).should eq(651)
    end
    context "when amount is nil" do
      it "should return nil" do
        to_cents(nil).should be_nil
      end
    end
  end

  describe "#to_monetary_unit" do
    it "should divide by 100" do
      to_monetary_unit(749).should eq(7.49)
      to_monetary_unit(751).should eq(7.51)
    end
    context "when cents is nil" do
      it("should return nil") { to_monetary_unit(nil).should be_nil }
    end
  end
end