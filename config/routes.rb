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

    resources :genres
    resources :items
    resources :customers,except: [:new, :create]
    resources :orders,except: [:new, :create, :delete, :edit]

    root :to => 'homes#top'

  end

  namespace :public do
    resource :homes, only: :top, as: :root

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
