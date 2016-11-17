class HomeController < ApplicationController
  def index
    @sound = Sound.new
  end

end
