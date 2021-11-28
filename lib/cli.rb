# frozen_string_literal: true

# CLI: command line
module CLI
  require_relative './cli/validator'
  require_relative './cli/parser'
  require_relative './cli/row'
  require_relative './cli/weblog_row'
  require_relative './cli/counter'
  autoload :Validator, './cli/validator'

  module_function

  def run(args = [])
    args = parse(args)
    return help if args.size != 1

    file = args.first
    return missing_file unless check_file(file)

    rows = Parser.parse(file)
    print_stats(rows)
    print_unique_stats(rows)
  end

  def missing_file
    puts 'Please provide an existing file'
  end

  def check_file(file)
    !file.nil? && File.exist?(file)
  end

  def print_stats(rows)
    puts 'visits'

    stats = Counter.count(rows)
    stats.sort_by { |variable| variable[1] }.reverse.each do |variable, count|
      puts "#{variable} #{count} visits"
    end
  end

  def print_unique_stats(rows)
    puts 'unique visits'
    stats = Counter.count(rows, unique: true)
    stats.sort_by { |variable| variable[1] }.reverse.each do |variable, count|
      puts "#{variable} #{count} visits"
    end
  end

  def parse(unparsed)
    # TODO: validate parameters
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
