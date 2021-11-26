module CLI
  class Row
    attr_accessor :fields
    def initialize(fields=[])
      @fields = fields
    end
  end
end