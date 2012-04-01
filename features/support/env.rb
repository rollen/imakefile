require_relative '../../lib/imakefile/file_structure.rb'

module DirectoryHelpers
  def sandbox_directory
    File.expand_path('../../../sandbox/', __FILE__)
  end
end

module Doubles
  class Output
    def initialize(buffer)
      @buffer = buffer
    end

    def write(text)
      @buffer << text
    end
  end
end

World(Doubles)
World(DirectoryHelpers)
