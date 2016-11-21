require "net/http"
require "uri"
module Sounds

  # Вычисление параметров сигнала производится на конечном числе дискретных точек N,
  # выбираемых из ряда значений кратных степени двойки: 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, и т.д.
  # Начальное значение N выбирается из параметров прочитанного файла.
  # Вычисляются максимальное и минимальное значение сигнала, азмах колебаний,
  # среднее квадратическое значение (СКЗ), пик-фактор.
  # Вычисление параметров производится начиная с точки,
  # соответствующей началу отображения сигнала в поле графика (условная нулевая точка).
  # Вычисленные параметры отображаются на графике или в специальном поле.

  class RangeService

    def initialize(sound)
      @sound = sound

    end

    def execute(start_index, end_index)
      points_part = @sound.points.slice(start_index, end_index)

      rms = Math.sqrt( 1.0 / points_part.size * points_part.inject(0){|sum,x| sum + x * x })
      min = points_part.min
      max = points_part.max
      pf = [min, max].max / rms

      {min: min, max: max, sound_range: max - min, rms: rms, pf: pf}

    end

  end
end
