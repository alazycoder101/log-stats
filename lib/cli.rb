module CLI
  extend self

  def run(args=[])
    args = parse(args)
    return help if args.size == 0
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