# frozen_string_literal: true

module CLI
  class Row
    attr_accessor :fields

    def initialize(*fields)
      @fields = fields.first.is_a?(Array) ? fields.first : fields
    end
  end
end
