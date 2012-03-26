require File.expand_path("../../spec_helper.rb", __FILE__)

module IMakeFile
  describe FileStructureMaker do 

    describe "directory" do
      context "creating a directory name mydir" do
        it "creates a directory" do
          root_directory = Stubs::FileSystemConfig.new.root_directory
          filename = 'mydir'
          storage = {}
          filesystem = Stubs::FileSystem.new(root_directory, storage) 
          fileutils = Stubs::FileUtils.new(filesystem)

          f = FileStructureMaker.new(fileutils, root_directory)
          f.directory(filename)

          filesystem.has_directory?(File.join(root_directory, filename)).should be_true
        end
      end

      describe "build" do
        it "" do
        end
      end
    end
  end
end

