Notepad::Engine.routes.draw do
  resources :notes, only: [:create, :update, :destroy]
end
