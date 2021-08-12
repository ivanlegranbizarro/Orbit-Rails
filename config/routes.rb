# frozen_string_literal: true

Rails.application.routes.draw do
  root 'html_page#home'
  get '/help', to: 'html_page#help'
  get '/about', to: 'html_page#about'
  get '/home', to: 'html_page#home'
  get '/contact', to: 'html_page#contact'
  get '/signup', to: 'users#new'
end
