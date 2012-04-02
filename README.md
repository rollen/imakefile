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
