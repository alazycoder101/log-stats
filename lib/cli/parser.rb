# frozen_string_literal: true

module CLI
  # parser to parse log file
  class Parser
    def self.parse(file, *counters)
      parser = CLI::Parser.new(file)
      parser.register(*counters)
      parser.parse
    end

    def initialize(file)
      @file = file
      @observers = []
    end

    def register(*counters)
      @observers.push(*counters)
    end

    def parse
      File.foreach(@file) do |line|
        @observers.each do |observer|
          observer.count(Row.new(line))
        end
      end
    end
  end
end
