module IMakeFile
  class FileStructure 
    def initialize(fileutils)
      @fileutils = fileutils
    end

    def directory(name)
      @fileutils.mkdir(name) 
    end
  end
end
