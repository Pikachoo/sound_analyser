
require "numru/fftw3"
include NumRu

module Sounds

  # Прямое преобразование:
  class SpectorService

    def initialize(sound)
      @sound = sound
    end

    def execute(start_index, end_index)

      # get nearest power of two
      number = end_index - start_index
      two_power_number = number
      while true
        if number.to_s(2) =~ /^10*$/
          two_power_number =  number
          break
        end
        number += 1
      end

      points_part = @sound.points.slice(start_index, two_power_number)

      na = NArray.to_na(points_part)
      fc = FFTW3.fft_fw(na)

      fc.abs.to_a.map{|item| item * 2}
    end

  end
end
