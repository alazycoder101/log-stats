# frozen_string_literal: true

module CLI
  # Row: row in log file
  class Row
    HEADERS = %i[path ip].freeze
    SEPERATOR = ' '

    attr_reader :path, :ip, :fields

    def initialize(text)
      parse(text)
      split
    end

    private

    def parse(text)
      if text.is_a? String
        @fields = text.split(SEPERATOR)
      elsif text.is_a? Array
        @fields = text
      end
    end

    def split
      HEADERS.each_with_index do |header, index|
        instance_variable_set :"@#{header}", fields[index]
      end
    end
  end
end
