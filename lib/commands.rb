require 'lib/scripts/base'
require 'lib/scripts/apple'
require 'lib/scripts/itunes'
require 'lib/scripts/safari'

# Load all the commands from the commands directory
Dir["lib/commands/*"].each{ |file| require file }

module Commands
  def self.all
    @all ||= constants.map{ |c| const_get(c) }
  end
end
