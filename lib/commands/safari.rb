module Commands
  class SafariUrl < SafariScript
    def self.matcher
      /safari (.+)/
    end

    def command
      "open location \"%s\""
    end
  end
end
