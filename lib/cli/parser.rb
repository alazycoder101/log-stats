# frozen_string_literal: true
require_relative './weblog_row'

module CLI
  # Parser: parse row into array
  class Parser
    attr_accessor :file, :rows

    SEPERATOR = ' '

    def self.parse(file)
      CLI::Parser.new(file).parse
    end

    def initialize(file)
      @file = file
      @rows = []
    end

    def parse
      File.foreach(@file) do |line|
        @rows << WeblogRow.new(line.split(SEPERATOR))
      end
      @rows
    end
  end
end
