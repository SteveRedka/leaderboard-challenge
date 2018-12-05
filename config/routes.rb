Rails.application.routes.draw do
  get '/', to: 'shows#index'
  namespace :shows do
    get :refresh_results
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
