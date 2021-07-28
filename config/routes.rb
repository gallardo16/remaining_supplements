# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'supplements#index'

  get 'home', to: 'home#index'
  resources :supplements

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
