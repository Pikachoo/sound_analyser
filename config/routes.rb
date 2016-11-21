Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :sounds
  namespace :api do
    post 'file/load' => 'files#load'
    get 'sounds/:id/get' => 'sounds#load_points'
    get 'sounds/:id/character' => 'sounds#load_sound_character'
    get 'sounds/:id/spector' => 'sounds#load_sound_spector'

  end

end
