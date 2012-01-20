require 'currency_magic/class_methods'
require 'currency_magic/railtie' if defined?(Rails)

module CurrencyMagic

  # Converts 'currency' to a Float
  #
  # Pretty much just strips out non-numeric characters and calls Object#to_f
  #
  # @param [Object] currency The amount of currency to be converted
  # @return [Float] the amount converted to float
  def currency_to_f(currency)

    return nil if currency.nil?
    return currency.to_f if currency.is_a?(Fixnum)

    currency.to_s.gsub(/[^0-9.]/, '').to_f
  end

  private
    # Converts dollars to cents by multiplying by 100
    #
    # @param [Float] dollars the amount as dollars
    # @return [Integer] the amount as cents
    def to_cents(dollars)
      (currency_to_f(dollars) * 100).round
    end

    # Converts cents to dollars by dividing by 100
    #
    # @param [Integer] cents the amount as cents
    # @return [Float] the amount as dollars
    def to_dollars(an_int)
      an_int.to_f / 100
    end
end
