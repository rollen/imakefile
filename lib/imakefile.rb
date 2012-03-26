require 'fileutils'
require 'trollop'
require File.expand_path("../imakefile/file_structure_maker", __FILE__)

opts = Trollop::options do
  opt :directory, "Specify a single directory", type: :string
end

f = IMakeFile::FileStructureMaker.new(FileUtils, Dir.pwd)
f.directory(opts[:directory]) if opts[:directory]

puts "Filestructure Successfully Created!!"
