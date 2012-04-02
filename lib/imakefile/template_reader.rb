module IMakeFile
  class TemplateReader
    def initialize(file, full_path)
      @file = file
      @full_path = full_path
    end

    def fetch(filename)
      @file.read([@full_path, filename.to_s].join('/'))
    end
  end
end

