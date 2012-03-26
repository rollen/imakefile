module IMakeFile
  class FileStructureMaker
    def initialize(fileutils, root)
      @fileutils = fileutils
      @root_directory = root
    end


    def directory(name)
      @fileutils.mkdir(name) 
    end

    def build(&block)
    end
  end
end
