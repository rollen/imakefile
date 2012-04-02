module IMakeFile
  class Factory
    def self.create_filestructure(options={})
      fileutils = FileUtils
      erb = ERB
      dir = Dir
      file = File
      output = IMakeFile::PrettyFormatter.new
      templates = IMakeFile::TemplateReader.new(file,options[:templates_path])
      builder = IMakeFile::FileStructure.new(fileutils, output, dir, templates, file, erb)
    end
  end
end
