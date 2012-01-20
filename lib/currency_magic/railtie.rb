require 'active_record'
require 'active_record/base'

module CurrencyMagic
  class Railtie < Rails::Railtie
    initializer "currency_magic.configure_rails_initialization" do
      ActiveRecord::Base.class.send(:include, CurrencyMagic::ClassMethods)
    end
  end
end
