class SoundsController < ApplicationController

  def create
    file_names = params[:files][:name]
    file_names.each do |name|
      if params[name] == 'on'
        sound_list_file =  SoundFile.find_by(file: name)
        @sounds = Sounds::CreateService.new.execute(sound_list_file.file.path)
      end
    end

    render 'index'
  end

  def index
    @sounds = Sound.where(id: 17)
  end

end
