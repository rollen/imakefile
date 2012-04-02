require_relative '../../lib/imakefile/file_structure.rb'
require_relative 'spies/spies.rb'

module IMakeFile
  describe FileStructure do
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

      context 'creating files using templates' do
        before(:each) do
          @file = SpyFile.new

          @erb = ERBSpy
          @erb.stub!(:result)

          @templates = {'classy' => "<%= params[:name] %>" }
          @templates.stub!(:fetch).and_return("<%= params[:name] %>")

          @fs = FileStructure.new(@fileutils, @output, nil, @templates, @file, @erb)
          @fs.stub!("write_contents")
          @fs.file('index', 'classy', { :name => 'Classy' })
        end

        it 'should find the right template' do
          @templates.should have_received(:fetch).with('classy')
        end

        it 'should allow for a file to use a template' do
          @fs.should have_received(:write_contents).with("<%= params[:name] %>", {:name => 'Classy'})
        end
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
