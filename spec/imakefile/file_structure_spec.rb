require_relative '../../lib/imakefile/file_structure.rb'
require 'rspec-spies'

module IMakeFile
  describe FileStructure do
    describe '.directory' do
      before(:each) do
        SpyFileUtils = Class.new
        @fileutils = SpyFileUtils.new
        @fileutils.stub!(:mkdir).and_return( nil )

        Output = Class.new
        @output = Output.new
        @output.stub!(:write).and_return( nil )

        fs = FileStructure.new(@fileutils, @output)
        fs.directory('index')
      end

      it 'should output success when the file has been successfully created' do
        @output.should have_received(:write).with('created index/')
      end

      it 'should interface with fileutils to create a directory' do
        @fileutils.should have_received(:mkdir).with('index')
      end
    end
  end
end
