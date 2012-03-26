module IMakeFile::Stubs
  class FileUtils 
    def initialize(filesystem)
      @filesystem = filesystem
    end

    def mkdir(name)
      @filesystem.write(name, "Directory")
    end
  end
end
