module Commands
  class Help < BaseScript
    def self.matcher
      /help/
    end

    def execute
      puts "\nThe following commands are available:\n\n"

      Commands.all.each do |command|
        puts command.matcher.source
      end

      puts
    end
  end
end
