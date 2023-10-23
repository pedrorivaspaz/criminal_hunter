Rails.application.routes.draw do
  namespace 'api' do
    resources :wanteds do
      collection do
       get 'search', to: 'wanteds#search'
      end
    end
  end

  # Devise
  get 'current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Swagger
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  root to: 'api/wanteds#index'
end