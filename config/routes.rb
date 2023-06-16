Rails.application.routes.draw do
  get 'visits/show'
  root 'links#new'
  get '/:token', to: 'links#redirect'
  get '/:token/info', to: 'visits#show', as: 'visit_info'
  resources :links, only: [:create]
end
