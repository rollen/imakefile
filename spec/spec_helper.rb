require File.expand_path("../../lib/imakefile.rb", __FILE__)
require File.expand_path("../imakefile/stubs/index.rb", __FILE__)
require 'rubygems'
require 'pry'

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
  config.formatter = :documentation
  config.before(:all) do
    @sandbox_directory = File.expand_path("../../sandbox", __FILE__)
  end
end
