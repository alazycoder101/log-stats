# frozen_string_literal: true

# CLI: command line
module CLI
  require_relative 'cli/row'
  require_relative 'cli/parser'
  require_relative 'cli/counter'
  require_relative 'cli/unique_counter'
  require_relative 'cli/logger'

  module_function

  def run(args = [])
    args = CLI.parse(args)
    return help if args.size != 1

    file = args.first
    return missing_file unless check_file(file)

    show_stats(file)
  end

  # default command
  def show_stats(file)
    rows = Parser.parse(file)
    counter = Counter.new(rows)
    Logger.info('all visits')
    counter.output

    Logger.info('unique visits')
    result = get_unique_stats(counter)
    print(result)
  end

  def missing_file
    Logger.error
    puts 'Please provide an existing file'
  end

  def check_file(file)
    !file.nil? && File.exist?(file)
  end

  def get_stats(counter)
    counter.count.sort_by { |variable| variable[1] }.reverse
  end

  def print(result)
    result.each do |variable, count|
      Logger.info "#{variable} #{count} visits"
    end
  end

  def get_unique_stats(counter)
    counter.unique.sort_by { |variable| variable[1] }.reverse
  end

  def parse(unparsed)
    unparsed
  end

  def help
    puts <<-USAGE
    Usage:
      #{$PROGRAM_NAME} file
    USAGE
  end

  def version
    require_relative './cli/version'
    VERSION
  end
end
