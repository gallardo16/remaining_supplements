# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'supplements#index'
  resource :supplements
end
