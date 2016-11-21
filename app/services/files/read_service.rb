require "net/http"
require "uri"
module Files

  # а) сигнатура файла - "TMB1": 4 байта, текст
  #
  # б) Количество каналов: 4 байта, целое (Количество каналов по которым принимался сигнал)
  #
  # в) Размер выборки на один канал: 4 байта, целое (число дискретных точек на один временной интервал приема данных (блок даных) N)
  #
  # г) Количество спектральных линий: 4 байта, целое (меньше или равно N/2)
  #
  # д) Частота среза: 4 байта, целое  (заданная частота среза ФНЧ при приеме данных)
  #
  # е) Частотное разрешение: 4 байта, вещественное (шаг по частоте между спектральными линиями при анализе, Гц )
  #
  # ж) Время приёма блока данных: 4 байта, вещественное (время за которое принимался  блок данных, величина обратная частотному разрешению)
  #
  # з) Общее время приёма данных: 4 байта, целое  (время приема всей реализации в секундах)
  #
  # и) Количество принятых блоков (задано пользователем): 4 байта, целое (то что было задано пользователем при приеме данных)
  #
  # к) размер данных: 4 байта, целое (количество дискретных отсчетов в файле даных)
  #
  # л) число принятых блоков(принято системой): 4 байта, целое (реально принятое число блоков)
  #
  # м) максимальное значение принятых данных: 4 байта, вещественное (максимальное значение  сигнала)
  #
  # н) минимальное значение принятых данных: 4 байта, вещественное (минимальное значение  сигнала)
  #
  #
  # далее идут данные в формате 4 байта, вещественное число для одного дискретного значения сигнала.


  class ReadService

    def execute(sound_file)
      sound = Sound.new
      File.open(sound_file.file.path) do |f|
        file_signature = f.read(4).first
        canal_number = f.read(4).unpack('l').first
        select_size = f.read(4).unpack('l').first
        spectral_number = f.read(4).unpack('l').first
        frequency = f.read(4).unpack('l').first
        frequency_extension = f.read(4).unpack('f').first
        block_time = f.read(4).unpack('f').first
        general_time = f.read(4).unpack('l').first
        user_blocks_number = f.read(4).unpack('l').first
        data_size = f.read(4).unpack('l').first
        system_blocks_number = f.read(4).unpack('l').first
        max_signal = f.read(4).unpack('f').first
        min_signal = f.read(4).unpack('f').first

        sound_file.update_attributes(file_signature: file_signature)
        sound = Sound.create(sound_file: sound_file,
                             canal_number: canal_number,
                             select_size: select_size,
                             spectral_number: spectral_number,
                             frequency: frequency,
                             frequency_extension: frequency_extension,
                             block_time: block_time,
                             general_time: general_time,
                             user_blocks_number: user_blocks_number,
                             data_size: data_size,
                             system_blocks_number: system_blocks_number,
                             max_signal: max_signal,
                             min_signal: min_signal)
      end
      sound
    end

end
end
