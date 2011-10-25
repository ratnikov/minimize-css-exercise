require 'rspec'

require 'minimize_css'

module Helpers
  def fixture_path(path)
    File.join(File.dirname(__FILE__), 'fixtures', path)
  end
end

RSpec.configure do |config|
  config.include Helpers
end
