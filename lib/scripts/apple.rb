class AppleScript < BaseScript
  def script(cmd)
    "osascript -e '#{cmd % @matches[1..-1]}'"
  end
end

class ApplicationScript < AppleScript
  def script(cmd)
    super "tell application \"#{application}\" to #{cmd}"
  end
end
