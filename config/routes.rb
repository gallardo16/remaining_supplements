# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'supplements#index'

  get 'home', to: 'home#index'
  resources :supplements

  get 'help', to: 'help#index'
  get 'tos', to: 'tos#index'
  get 'policy', to: 'policy#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
