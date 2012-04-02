module IMakeFile
  class Factory
    def self.create_filestructure(options={})
      fileutils = FileUtils
      erb = ERB
      dir = Dir
      file = File
      output = IMakeFile::PrettyFormatter.new
      templates = IMakeFile::TemplateReader.new(options[:templates_path], file)
      builder = IMakeFile::FileStructure.new(@fileutils, @output, @dir, @template, @file, @erb)
    end
  end
end
