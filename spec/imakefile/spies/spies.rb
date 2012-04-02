require 'rspec-spies'

class IMakeFile::SpyFileUtils 
end
class IMakeFile::Output
end
class IMakeFile::SpyDir
end
class IMakeFile::SpyFile
  def open(name, mode)
    yield(self)
  end

  def puts(string)
  end
end
class IMakeFile::ERBSpy
end


