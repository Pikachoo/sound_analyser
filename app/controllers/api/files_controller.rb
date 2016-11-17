class Api::FilesController < ApplicationController

  def load
    # debugger
    # file = SoundFile.create(file_params)
  end

  private

  def file_params
    params.permit(:file, :directory) # and here
  end

end
