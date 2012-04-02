require_relative '../../lib/imakefile/pretty_formatter.rb'
require 'rspec-spies'

module IMakeFile
  describe PrettyFormatter do
    describe '.write' do
      it 'outputs formatted text to stdout' do
        pf = PrettyFormatter.new
        pf.stub!(:green)
        pf.write('index')
        pf.should have_received(:green).with('index')
      end
    end
  end
end
