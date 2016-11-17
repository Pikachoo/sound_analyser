class SoundsController < ApplicationController

  def create
    debugger
  end


  private

  def sound_params
    params.require(:sound).permit(file: []) # and here
  end
end
