Rails.application.routes.draw do
  root "email_threads#inbox"

  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  resource :settings, only: %i[edit update]

  resources :email_threads, only: [ :new, :show ] do
    member do
      get :inbox
      get :reply_later
      get :all
    end
  end

  resources :email_servers

  # TODO: Do we need this?
  # scope "EmailServers/new" do
  #   scope "bank" do
  #     get "", to: "email_servers#new_bank", as: "new_bank"
  #   end
  #
  #   scope "credit" do
  #     get "", to: "email_servers#new_credit", as: "new_credit"
  #   end
  # end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up", to: "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest

  get "all", to: "emails#all", as: :all
  get "reply_later", to: "emails#reply_later", as: :reply_later
end
