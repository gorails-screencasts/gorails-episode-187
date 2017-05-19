module Commands
  class ListPlaylists < ITunesScript
    def self.matcher
      /list playlists/
    end

    def command
      "get name of playlists as list"
    end

    def on_complete(result)
      puts result.last
    end
  end

  class CountPlaylists < ITunesScript
    def self.matcher
      /count playlists/
    end

    def command
      "get count of playlists"
    end

    def on_complete(result)
      puts result.last
    end
  end

  class StartPlaylist < ITunesScript
    def self.matcher
      /start playlist (.+)/
    end

    def command
      "play playlist \"%s\""
    end
  end

  class ListPlaylistTracks < ITunesScript
    def self.matcher
      /list tracks in playlist (.+)/
    end

    def command
      "get name of tracks in playlist \"%s\" as list"
    end

    def on_complete(result)
      puts result.last
    end
  end
end
