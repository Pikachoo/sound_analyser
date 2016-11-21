require "net/http"
require "uri"
module Sounds

  class CreateService

    def execute(file)
      sounds = []
      File.open(file).each do |line|
        sound_file = SoundFile.find_by(file: line.strip)
        sound = Sound.find_by(sound_file: sound_file)

        sound = Files::ReadService.new.execute(sound_file) if !sound && sound_file

        sounds.push sound
      end
      sounds
    end

  end
end
