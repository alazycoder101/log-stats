# frozen_string_literal: true

module CLI
  # Counter: count visits to paths
  class UniqueCounter
    attr_reader :stats

    def initialize
      @stats = {}
    end

    def count(row)
      @stats[row.path] ||= { count: 0, ips: {} }
      stat = @stats[row.path]
      ips = stat[:ips]
      if ips.key? row.ip
        ips[row.ip] += 1
      else
        stat[:count] += 1
        ips[row.ip] = 1
      end
    end

    def output
      status.each do |key, value|
        $stdout.puts "#{key} #{value[:count]}"
      end
    end
  end
end
