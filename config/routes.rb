Rails.application.routes.draw do
  namespace 'api' do
    resources :wanteds do
      collection do
        get '/', to: 'wanteds#search'
      end
    end
  end

#Devise
  devise_for :users

#Swagger
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root to: 'api/wanteds#index'
end
