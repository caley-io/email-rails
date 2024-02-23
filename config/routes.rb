Rails.application.routes.draw do
  resource :registration
  resource :sessions
  resource :password_reset
  resource :password
  resource :settings, only: %i[edit update]

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
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "pages#inbox"

  get "done" => "pages#done", as: :done
  get "team" => "pages#team", as: :team
  get "calendar" => "pages#calendar", as: :calendar
  get "vip" => "pages#vip", as: :vip
  get "sent" => "pages#sent", as: :sent
  get "later" => "pages#later", as: :later
  get "draft" => "pages#draft", as: :draft
  get "archive" => "pages#archive", as: :archive
  get "trash" => "pages#trash", as: :trash
end
