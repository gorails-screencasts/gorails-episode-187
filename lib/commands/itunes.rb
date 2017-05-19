module Commands
  class PlayScript < QuickCommand
    def self.matcher
      /play/
    end

    def command
      "play"
    end
  end

  class PauseScript < QuickCommand
    def self.matcher
      /pause/
    end

    def command
      "pause"
    end
  end

  class WhosPlaying < ITunesScript
    def self.matcher
      /whos playing/
    end

    def command
      "artist of current track as string"
    end
  end

  class WhatsPlaying < ITunesScript
    def self.matcher
      /whats playing/
    end

    def command
      "name of current track as string"
    end
  end

  class NextTrack < ITunesScript
    def self.matcher
      /next track/
    end

    def command
      "next track"
    end
  end

  class PreviousTrack < ITunesScript
    def self.matcher
      /previous track/
    end

    def command
      "previous track"
    end
  end

  class ShuffleOn < ITunesScript
    def self.matcher
      /shuffle on/
    end

    def command
      "set shuffle of current playlist to 1"
    end
  end

  class ShuffleOff < ITunesScript
    def self.matcher
      /shuffle off/
    end

    def command
      "set shuffle of current playlist to 0"
    end
  end
end
