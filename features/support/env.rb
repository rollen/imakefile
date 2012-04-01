require_relative '../../lib/imakefile/file_structure.rb'

module DirectoryHelpers
  def sandbox_directory
    File.expand_path('../../../sandbox/', __FILE__)
  end
end

World(DirectoryHelpers)
