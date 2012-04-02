module IMakeFile
  class PrettyFormatter
    def write(text)
      puts green(text)
    end

    def green(string)
      "\e[32m#{string}\e"
    end
  end
end
