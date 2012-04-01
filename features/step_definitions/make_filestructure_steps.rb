Given /^that a directory named index does not exist$/ do
  File.directory?('index').should be_false    
end

When /^directory\('index'\) is invoked$/ do
  @lingo = IMakeFile::FileStructure.new.directory('index')
end

Then /^a folder named index should be created$/ do
  File.directory?('index').should be_true   
end

