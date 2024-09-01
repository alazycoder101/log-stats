# frozen_string_literal: true

module CLI
  # Counter: count visits to paths
  class Counter
    attr_reader :stats

    def initialize
      @stats = {}
    end

    def count(row)
      @stats[row.path] ||= 0
      @stats[row.path] += 1
    end
  end
end
