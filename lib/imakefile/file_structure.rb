require 'erb'

module IMakeFile
  class FileStructure 
    def initialize(fileutils, output, dir, templates=nil, file=nil, erb=nil)
      @fileutils = fileutils
      @output = output
      @dir = dir 
      @templates = templates
      @file = file
      @erb = erb
    end

    def file(name, template_name=nil, params=nil)
      @fileutils.touch(name)
      @file.open(name, 'w') do |f|
        f.puts write_contents(@templates[template_name], params) 
      end unless template_name.nil? 
      @output.write("created #{name}")
    end

    def write_contents(template, params)
      @erb.new(template).result(binding).chomp
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
