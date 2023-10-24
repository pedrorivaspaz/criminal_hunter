Rails.application.routes.draw do
  namespace 'api' do
    resources :wanteds do
      collection do
       get 'search', to: 'wanteds#search'
      end
    end
  end
  # Devise
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}


  # Swagger
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root to: 'api/wanteds#index'
end