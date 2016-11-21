class Api::SoundsController < ApplicationController


  def load_points
    sound = Sound.find(params[:id])
    points = sound.points

    result = {data:  points, pointStart: 0,  pointInterval: 1, file_name: sound.sound_file.file.file.filename,
              block_time: sound.block_time,  data_size: sound.data_size, general_time: sound.general_time}
    render json: result
  end



  def load_sound_character
    start_p = params[:start]
    end_p = params[:end]
    id = params[:id]

    sound = Sound.find(id)
    start_index = start_p ? start_p.to_f.round : 0
    end_index =  end_p ? end_p.to_f.round : sound.data_size

    render json: Sounds::RangeService.new(sound).execute(start_index, end_index)
  end

  def load_sound_spector
    start_p = params[:start]
    end_p = params[:end]
    id = params[:id]

    sound = Sound.find(id)
    start_index = start_p ? start_p.to_f.round : 0
    end_index =  end_p ? end_p.to_f.round : sound.data_size

    render json: {data: Sounds::SpectorService.new(sound).execute(start_index, end_index),
                  pointStart: 0,  pointInterval: 1,  data_size: sound.data_size, general_time: sound.general_time,
                  frequency: sound.analyse_frequency(end_index - start_index)}
  end

end
