Rails.application.routes.draw do

 
  # 管理者用 URL/admin/sign_in...
  devise_for :admin, skip:[:registrations, :passwords],controllers:{
    sessions:"admin/sessions"
  }

  # 顧客用 URL/customers/sign_in...
  devise_for :customers, skip:[:passwords],controllers:{
    registrations:"public/registrations",
    sessions:'public/sessions'
  }

  namespace :admin do
    resource :homes, only: :top, as: :root

    resources :genres
    resources :items
    resources :customers
    
  end

  namespace :public do
    resource :homes, only: :top, as: :root
    root to: 'homes#top'

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
