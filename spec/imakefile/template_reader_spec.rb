require_relative '../../lib/imakefile/template_reader.rb'
require_relative 'spies/spies.rb'

module IMakeFile
  describe TemplateReader do
    describe '.fetch' do
      it 'reads a given directory of all its files' do
        file = SpyFile.new
        file.stub!('read')

        full_path_to_templates = '/full/path/to/templates/'

        tr = TemplateReader.new(file, full_path_to_templates)
        tr.fetch(:filename)
        file.should have_received(:read).with([full_path_to_templates, 'filename'].join('/'))
      end
    end
  end
end

