Notepad::Engine.routes.draw do
  resources :notes, only: [:create, :edit, :update, :destroy]
end
