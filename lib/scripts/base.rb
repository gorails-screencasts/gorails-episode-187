class BaseScript
  attr_accessor :matches

  def self.match?(input)
    r = Regexp.new "^#{matcher.source}$"
    r.match(input)
  end

  def self.matcher
    raise StandardError, "You must define a 'matcher' method that returns a regex"
  end

  def initialize(matches=[])
    @matches = matches
  end

  def run
    result = execute
    on_complete(result)
  end

  def on_complete(result)
    result
  end

  private

  def execute
    puts full_script if ENV["DEBUG"]
    output = `#{full_script}`
    [$?.exitstatus == 0 , output.strip]
  end

  def full_script
    script(command)
  end

  def script(cmd)
    raise StandardError, "You must implement the 'script' method"
  end

  def command
    raise StandardError, "You must implement the 'command' method"
  end
end
