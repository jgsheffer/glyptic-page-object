class GlypticPageObject

    def initialize(page_map, pages_loaction)
        @@pages_location = pages_loaction
        @@page_map = page_map
    end

    def load(page_key_name)
      class_file_pair = @@page_map[page_key_name]
      raise "Your page map does not appear to be formatted correctly for #{page_key_name}" if class_file_pair.size != 2
      puts "Your page map does not appear to be formatted correctly for #{page_key_name}" if class_file_pair.size != 2
      class_name = class_file_pair[0]
      file_name = class_file_pair[1]
      raise "No page data found for #{page_key_name}" if (file_name == nil || class_name == nil)
      require_relative("#{@@pages_location}/#{file_name}")
      Kernel.const_get(class_name).new
    end
end