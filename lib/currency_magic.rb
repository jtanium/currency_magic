require 'active_record/base'

module CurrencyMagic

#  def method_missing(meth_name, *args, &block)
#
#    return super(meth_name, *args, &block) unless currency_method?(meth_name)
#
#    c_meth_name = cents_method_name(meth_name)
#    if c_meth_name.to_s.ends_with?('=')
#      send(c_meth_name, to_cents(args.first))
#    else
#      to_dollars send(c_meth_name)
#    end
#  end

#  def respond_to?(meth_name)
#
#    return super(meth_name) unless currency_method?(meth_name)
#
#    self.respond_to?(cents_method_name(meth_name))
#  end

  def currency_to_f(currency)

    return nil if currency.nil?
    return currency if currency.is_a?(Fixnum)

    currency.to_s.gsub(/[^0-9.]/, '').to_f
  end

  private
    def to_cents(dollars)
      f = currency_to_f(dollars)
      return nil if f.nil?

      (f * 100).round
    end

    def to_dollars(an_int)
      an_int.to_f / 100
    end

#    def currency_method?(method_name)
#      method_name.to_s =~ /_dollars=?$/
#    end

#    def cents_method_name(meth_name)
#      meth_name.to_s.sub(/_dollars/, '').to_sym
#    end
end

class << ActiveRecord::Base

  def currency_magic(currency, *methods)
    class_eval "include CurrencyMagic"
    methods.each do |method|
      class_eval <<-EOD
        def #{method}_#{currency}
          to_dollars self.#{method}
        end
        def #{method}_#{currency}=(#{method})
          self.#{method} = to_cents(#{method})
        end
      EOD
#      define_method("#{method}_#{currency}".to_sym) do
#      end
#      define_method("#{method}_#{currency}=".to_sym) do |arg|
#      end
    end
  end
end
