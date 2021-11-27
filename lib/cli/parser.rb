# frozen_string_literal: true

module CLI
  class Parser
    attr_accessor :file, :rows

    SEPERATOR = ' '

    def self.parse(file)
      if file.nil?
        puts 'Please provide a file'
        exit
      end

      unless File.exist?(file)
        puts 'File does not exist'
        exit
      end

      CLI::Parser.new(file).parse
    end

    def initialize(file)
      @file = file
      @rows = []
    end

    def parse
      File.foreach(@file) do |line|
        @rows << Row.new(line.split(SEPERATOR))
      end
      @rows
    end
  end
end
