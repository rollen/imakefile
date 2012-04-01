module IMakeFile
  class FileStructure 
    def initialize(fileutils, output, dir)
      @fileutils = fileutils
      @output = output
      @dir = dir 
    end

    def file(name)
      @fileutils.touch(name)
      @output.write("created #{name}")
    end

    def directory(name)
      @fileutils.mkdir(name) 
      @output.write("created #{name}/")
      if block_given? then
        @dir.chdir(name) { yield(self) }
      end
    end
  end
end
