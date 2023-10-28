require 'sidekiq/web'

Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use Rails.application.config.session_store, Rails.application.config.session_options

Rails.application.routes.draw do

  mount Sidekiq::Web => '/sidekiq'

  namespace 'api' do
    resources :wanteds do
      collection do
       get 'search', to: 'wanteds#search'
      end
    end
  end

  # Swagger
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root to: 'api/wanteds#index'
end