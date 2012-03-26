Given /^I have the binary "([^"]*)"$/ do |filename|
  @binary = File.expand_path("#{File.dirname(__FILE__)}/../../bin/#{filename}")
  File.exists?(@binary).should be_true
end

Given /^the option "([^"]*)"$/ do |option|
  @options = option
end

When /^I run imakefile with the option$/ do 
  steps %{
  When I run `#{@binary} #{@options}`
  }
end

Then /^a directory named "([^"]*)" should be created$/ do |directory|
  steps %{
  Then a directory named "#{directory}" should exist
  }
end

