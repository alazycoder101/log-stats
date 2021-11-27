module CLI
  require_relative '../lib/cli/row'
  require_relative '../lib/cli/parser'
  require_relative '../lib/cli/counter'
  extend self

  def run(args=[])
    args = parse(args)
    return help if args.size != 1
    file = args.first
    return help unless File.exist?(file)

    rows = Parser.parse(file)
    stats = Counter.count(rows)

    puts "visits"
    stats.sort_by{ |variable| variable[1] }.reverse.each do |variable, count|
      puts "#{variable} #{count} visits"
    end

    puts ""
    puts "unique visits"
    stats = Counter.count(rows, true)
    stats.sort_by{ |variable| variable[1] }.reverse.each do |variable, count|
      puts "#{variable} #{count} visits"
    end
  end

  def parse(unparsed)
    unparsed
  end

  def help
    puts <<-EOF
    Usage:
      #{$0} file
    EOF
  end

  def version
    require_relative './cli/version'
    VERSION
  end
end