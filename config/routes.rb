# frozen_string_literal: true

Rails.application.routes.draw do
  get "home", to: "home#index"
  get "tos", to: "tos#index"
  get "policy", to: "policy#index"

  authenticated :user do
    root "supplements#index", as: "user_authenticated_root"
  end
  root "home#index"

  devise_for :users
  resources :supplements

  namespace :api do
    resources :supplements, only: [:index]
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
