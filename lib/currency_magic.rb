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
    return currency.to_f if currency.is_a?(Integer)

    currency.to_s.gsub(/[^-0-9.]/, '').to_f
  end

  private
    # Converts a monetary unit to cents by multiplying by 100
    #
    # @param [Float] monetary_unit the amount as a whole monetary unit
    # @return [Integer] the amount as cents
    def to_cents(monetary_unit)
      f = currency_to_f(monetary_unit)
      return nil if f.nil?

      (f * 100).round
    end

    # Converts cents to a monetary unit by dividing by 100
    #
    # @param [Integer] cents the amount as cents
    # @return [Float] the amount as a monetary unit
    def to_monetary_unit(cents)
      return nil if cents.nil?

      cents.to_f / 100
    end
end
