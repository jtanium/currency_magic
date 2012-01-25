module CurrencyMagic
  module ClassMethods

    def currency_magic(currency, *methods)
      class_eval "include CurrencyMagic"
      methods.each do |method|
        class_eval <<-EOD
          def #{method}_#{currency}
            to_monetary_unit self.#{method}
          end
          def #{method}_#{currency}=(#{method})
            self.#{method} = to_cents(#{method})
          end
        EOD
      end
    end

  end
end
