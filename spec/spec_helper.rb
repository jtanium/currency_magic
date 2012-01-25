require 'rspec'

$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
  config.formatter = :progress
end