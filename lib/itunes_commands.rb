#!/usr/bin/env ruby
require 'readline'
require 'open4'

@complete = nil
@success = nil
@output = nil
@playlist_name = ""
@current_volume = ""
@new_volume =""

ITUNES_QUICK_COMMANDS = {
  "whats playing" => "to name of current track as string",
  "whos playing" => "to artist of current track as string",
  "pause" => "to pause",
  "play" => "to play",
  "next track" => "to next track",
  "previous track" => "to previous track",
  "shuffle on" => "to set shuffle of current playlist to 1",
  "shuffle off" => "to set shuffle of current playlist to 0"
}

ITUNES_LONG_COMMANDS = {
  "list playlists" => "to get name of playlists as string",
  "count playlists" => "to get count of playlists",
  "start playlist" => "to play playlist",
  "list tracks in playlist" => "to get name of tracks in playlist"
}

MAC_COMMANDS = {
  "volume normal" => "set volume output volume",
  "volume quiet" => "set volume output volume"
}

def execute_command(command)
  _pid, stdin, stdout, stderr = Open4.popen4 'sh'

  puts "#{command}"
  stdin.puts command
  stdin.close
  @success = true
  return @output = stdout.read.strip
end

def run
  until @complete
    prompt = @success ? 'Done, anything else?: ' : 'How can I help you?: '
    input = Readline.readline(prompt, true).downcase
    exit if %w(quit exit).include?(input)
    command_var = set_command(input)
    execute_command("osascript -e '#{command_var} #{@new_volume}'") unless @new_volume.empty?
    execute_command("osascript -e 'tell application \"iTunes\" #{command_var} \"#{@playlist_name}\"'") unless @playlist_name.empty?
    execute_command("osascript -e 'tell application \"iTunes\" #{command_var}'") unless input.empty? || !@playlist_name.empty?
    output_format(input)
    puts @output
    @new_volume = ""
    @playlist_name = ""
  end
end

def output_format(input)
  return @ouput unless ITUNES_QUICK_COMMANDS[input]
  artist = execute_command("osascript -e 'tell application \"iTunes\" to artist of current track as string'")
  track = execute_command("osascript -e 'tell application \"iTunes\" to name of current track as string'")
  @output = "#{input.upcase} the song \"#{track.upcase}\" by \"#{artist.upcase}\"."
end

def set_command(input)
  if input.include? "start playlist"
    discard, @playlist_name = input.split("playlist ")
    input = "start playlist"
  elsif input.include? "list tracks in playlist"
    discard, @playlist_name = input.split("playlist ")
    input = "list tracks in playlist"
  elsif input.include? "volume normal"
    @new_volume = "30"
  elsif input.include? "volume quiet"
    @new_volume = "10"
  end
  command = ITUNES_QUICK_COMMANDS[input] if ITUNES_QUICK_COMMANDS.include? input
  command = ITUNES_LONG_COMMANDS[input] if ITUNES_LONG_COMMANDS.include? input
  command = MAC_COMMANDS[input] if MAC_COMMANDS.include? input
  return command
end
