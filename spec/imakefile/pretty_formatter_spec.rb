require 'rspec-spies'

module IMakeFile
  class PrettyFormatter
    def write(text)
      puts green(text)
    end

    def green(string)
      "\e[32m#{string}\e"
    end
  end

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
