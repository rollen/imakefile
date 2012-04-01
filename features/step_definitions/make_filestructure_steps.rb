Before do
  FileUtils.rm_rf(sandbox_directory)
  FileUtils.mkdir(sandbox_directory)
  Dir.chdir(sandbox_directory)
end

Given /^that a file named myfile does not exist$/ do
  File.file?('myfile').should be_false    
end


Given /^that a directory named index does not exist$/ do
  File.directory?('index').should be_false    
end

Given /^that the following directories do not exist$/ do |table|
  table.hashes.each do |row|
    File.directory?(row[:dirname]).should be_false
  end
end

When /^directory\('index'\) is invoked$/ do
  @buffer = []
  @output = Output.new(@buffer)
  @fileutils = FileUtils

  @builder = IMakeFile::FileStructure.new(@fileutils, @output, nil, nil)
  @builder.directory('index')
end

When /^I create them using the specified dsl$/ do |table|
  @builder = create_file_structure

  @builder.directory('root') do |d|
    d.directory('app')
  end
end

When /^file\('index'\) is invoked$/ do
  @builder = create_file_structure
  @builder.file('index')
end

Then /^a folder named index should be created$/ do
  File.directory?('index').should be_true   
end


Then /^I should see 'created index\/'$/ do
  @buffer.include?('created index/').should be_true
end


Then /^I should see the root and root\/app directories$/ do
  File.directory?('root').should be_true
  File.directory?('root/app').should be_true
end


Then /^a file named index should be created$/ do
  File.exists?('index').should be_true
end

Then /^I should see 'created file'$/ do
  @buffer.include?('created index').should be_true
end


Given /^the following erb template named classy$/ do |erb_template|
  @template = { 'classy' => erb_template }
end

When /^I create a file named classy from the template$/ do
  @buffer = []
  @output = Output.new(@buffer)
  @fileutils = FileUtils

  @erb = ERB
  @file = File

  @builder = IMakeFile::FileStructure.new(@fileutils, @output, nil, @template, @file, @erb)
  @builder.file('index', 'classy', { :name => 'Classy' })
end

Then /^I should see the following generate file$/ do |string|
  File.read('index').should =~ Regexp.new(string)
end


