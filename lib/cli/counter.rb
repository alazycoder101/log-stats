# frozen_string_literal: true

module CLI
  class Counter
    attr_accessor :rows, :stats

    def self.count(rows, unique = false)
      counter = Counter.new(rows)
      if unique
        counter.unique
      else
        counter.count
      end
    end

    def initialize(rows = [])
      @rows = rows
    end

    def count
      @stats = @rows.group_by { |row| row.fields[0] }.map { |variable| [variable[0], variable[1].size] }
    end

    def unique
      @stats = @rows.group_by { |row| row.fields[0] }.map do |variable|
        [variable[0], variable[1].map do |row|
                        row.fields[1]
                      end.uniq.size]
      end
    end
  end
end
