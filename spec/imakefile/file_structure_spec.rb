require_relative '../../lib/imakefile/file_structure.rb'
require 'rspec-spies'

module IMakeFile
  describe FileStructure do
    before(:all) do
      SpyFileUtils = Class.new
      Output = Class.new
      SpyDir = Class.new
      SpyFile = Class.new do
        def open(name, mode)
          yield(self)
        end

        def puts(string)
        end
      end
      ERBSpy = Class.new
    end

    before(:each) do
      @fileutils = SpyFileUtils.new

      @output = Output.new
      @output.stub!(:write).and_return( nil )

      @fs = FileStructure.new(@fileutils, @output, nil)
    end


    describe '.file' do
      before(:each) do
        @fileutils.stub!(:touch).with('index')
      end

      it 'should interface with fileutils to create a file' do
        @fs.file('index')
        @fileutils.should have_received(:touch).with('index')
      end

      it 'should output success when the file has been successfully created' do
        @fs.file('index')
        @output.should have_received(:write).with('created index')
      end

      it 'should allow for a file to use a template' do
        @file = SpyFile.new

        @erb = ERBSpy
        @erb.stub!(:result)

        @fs = FileStructure.new(@fileutils, @output, nil, { 'classy' => "<%= params[:name] %>" }, @file, @erb)
        @fs.stub!("write_contents")
        @fs.file('index', 'classy', { :name => 'Classy' })
        @fs.should have_received(:write_contents).with("<%= params[:name] %>", {:name => 'Classy'})
      end
    end

    describe '.directory' do
      before(:each) do
        @fileutils.stub!(:mkdir).and_return( nil )
      end
      it 'should output success when the file has been successfully created' do
        @fs.directory('index')
        @output.should have_received(:write).with('created index/')
      end

      it 'should interface with fileutils to create a directory' do
        @fs.directory('index')
        @fileutils.should have_received(:mkdir).with('index')
      end

      it 'should change its directory if it receives a block' do
        @dir = SpyDir.new
        @dir.stub!(:chdir)


        @fs = FileStructure.new(@fileutils, @output, @dir)
        @dir.should_receive(:chdir).and_yield #Forced to use a mock

        @fs.directory('projectname') do |d|
          d.directory('app')
        end
      end
    end
  end
end
