# frozen_string_literal: true

module CLI
  # Logger: log messages
  class Logger
    class << self
      def error(message)
        $stderr.warn message.colorize(:red)
      end

      def info(message)
        $stdout.puts message
      end
    end
  end
end
