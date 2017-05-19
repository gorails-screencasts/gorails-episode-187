module Commands
  class VolumeNormalScript < AppleScript
    def self.matcher
      /volume normal/
    end

    def command
      "set volume output volume 50"
    end
  end

  class VolumeQuietScript < AppleScript
    def self.matcher
      /volume quiet/
    end

    def command
      "set volume output volume 10"
    end
  end

  class VolumeScript < AppleScript
    def self.matcher
      /volume (.+)/
    end

    def command
      "set volume output volume %s"
    end
  end
end
