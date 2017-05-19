require 'readline'
require 'lib/commands'

class AppController
  def run
    while input = get_next_input
      matches = nil
      command = Commands.all.find{ |c| matches = c.match? input }

      if command
        command.new(matches).run
      else
        puts "Unable to find a matching command"
      end
    end
  end

  def get_next_input
    prompt = "How can I help you? "
    input = Readline.readline(prompt, true)
    input = nil if %w(q quit exit).include?(input.downcase)
    input
  end
end
