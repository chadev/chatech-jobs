ChatechJobs::Application.routes.draw do

  devise_for :users
  root to: 'pages#root'

  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

end
