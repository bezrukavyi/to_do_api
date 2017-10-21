Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      mount_devise_token_auth_for User.name, at: 'auth', controllers: {
        registrations:      'api/v1/auth/registrations',
        sessions:           'api/v1/auth/sessions',
        omniauth_callbacks: 'api/v1/auth/omniauth_callbacks',
        passwords:          'api/v1/auth/passwords'
      }

      resources :projects do
        resources :tasks, only: %i[index create]
      end

      resources :tasks, only: %i[show update destroy] do
        resources :attachments, only: %i[index create]
      end

      resources :attachments, only: %i[destroy]
    end
  end
end
