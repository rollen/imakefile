module IMakeFile::Stubs
  class FileSystem
    def initialize(current_dir, db)
      @current_dir = current_dir
      @db = db
    end

    def write(name, type)
      @db[File.join(@current_dir, name)] = type
    end

    def has_directory?(key)
      @db.has_key?(key.to_s)
    end
  end
end
