IMakeFile
=========

IMakeFile is a tool for generating directories and files.

Requirements
------------

IMakefile only depends on rubygems


Installation
------------

  gem install imakefile


Usage
-----

### Simple directory generation
    
    require 'rubygems'
    require 'imakefile'

    builder = IMakeFile::Factory.create_filestructure

    builder.directory('filename')

Running this will create a directory named filename 

### Nested file structure

If you would like to create a filestructure similar to Rails all you have to do is the following.

    require 'rubygems'
    require 'imakefile'

    builder = IMakeFile::Factory.create_filestructure

    builder.directory('appname') do |b|
      b.directory('app') do
        b.directory('controllers')
        b.directory('models')
        b.directory('views')
      end
      b.directory('lib')
      b.directory('doc')
      b.directory('db')
      b.file('Gemfile')
      b.file('config.ru')
      b.file('README')
    end

running this example will create a filestructure similar to the above

### Using Erb templates

Given that we have the following erb file, named 'template.erb', located at '/path/to/erb'
    
    class <%= params[:name] %>
      def initialize
      end
    end

When we run the following code from the folder '/path/to/any/folder'

    require 'rubygems'
    require 'imakefile'

    builder = IMakeFile::Factory.create_filestructure(:templates_path => '/path/to/erb')

    builder.file('classy.rb', 'template.erb', {:name => 'Classy'})

Then we will see the following file named 'classy.rb' at '/path/to/any/folder'

    class Classy
      def initialize 
      end
    end

