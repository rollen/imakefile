Before do
  @pwd = Dir.pwd
  FileUtils.rm_rf(sandbox_directory)
  FileUtils.mkdir(sandbox_directory)
  Dir.chdir(sandbox_directory)
end

Given /^that a directory named index does not exist$/ do
  File.directory?('index').should be_false    
end

When /^directory\('index'\) is invoked$/ do
  @builder = IMakeFile::FileStructure.new(FileUtils)
  @builder.directory('index')
end

Then /^a folder named index should be created$/ do
  File.directory?('index').should be_true   
end

