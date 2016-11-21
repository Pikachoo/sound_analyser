class Sound < ActiveRecord::Base
  belongs_to :sound_file

  def points
    File.open(sound_file.file.path) do |f|
      f.read(4 * 13)

      data = []
      while item = f.read(4)
        data.push item.unpack('f').first
      end

      data

    end
  end

  def analyse_frequency(point_number)
    1.0 / ( point_number * block_time.to_f / select_size)
  end

end
