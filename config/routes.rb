Notepad::Engine.routes.draw do
  resources :notes, only: [:show, :create, :edit, :update, :destroy]
end
