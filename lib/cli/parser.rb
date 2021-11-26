module CLI
  class Parser
    attr_accessor :file, :rows

    SEPERATOR = " "

    def self.parse(file)
      if file.nil?
        puts "Please provide a file"
        exit
      end

      if !File.exist?(file)
        puts "File does not exist"
        exit
      end

      if File.size(file) == 0
        puts "File is empty"
        exit
      end

      if File.size(file) > 1000000
        puts "File is too large"
        exit
      end

      CLI::Parser.new(file).parse
    end
    def initialize(file)
      @file = file
      @rows = []
    end

    def parse
      File.foreach(@file) { |line|
        @rows << Row.new(line.split(SEPERATOR))
      }
      @rows
    end
  end

end
