ChatechJobs::Application.routes.draw do

  resources :jobs, :only => [:show]

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'jobs#index'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
end
