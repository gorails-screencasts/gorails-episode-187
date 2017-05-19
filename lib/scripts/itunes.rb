class ITunesScript < ApplicationScript
  def application
    "iTunes"
  end
end

class QuickCommand < ITunesScript
  def on_complete(result)
    success, artist = Commands::WhosPlaying.new.run
    success, track  = Commands::WhatsPlaying.new.run

    puts "#{command.upcase} the song #{track.upcase} by #{artist.upcase}"
  end
end
