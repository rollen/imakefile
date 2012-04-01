module IMakeFile
  class FileStructure 
    def initialize(fileutils, output)
      @fileutils = fileutils
      @output = output
    end

    def directory(name)
      @fileutils.mkdir(name) 
      @output.write("created #{name}/")
    end
  end
end
