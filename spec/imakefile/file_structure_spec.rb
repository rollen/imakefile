require_relative '../../lib/imakefile/file_structure.rb'
require 'rspec-spies'

module IMakeFile
  class SpyFileUtils; end

  describe FileStructure do
    describe '.directory' do
      it 'should interface with fileutils to create a directory' do
        SpyFileUtils = Class.new
        fileutils = SpyFileUtils.new
        fileutils.stub!(:mkdir).and_return( nil )

        fs = FileStructure.new(fileutils)
        fs.directory('index')

        fileutils.should have_received(:mkdir).with('index')
      end
    end
  end
end
