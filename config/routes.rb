Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'group_chat#index'
  post 'group_chat', to: 'group_chat#create'
end
