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

    patch '/order_items/:id' => 'order_items#update'
    patch '/orders/:id' => 'orders#order'
    get '/orders/:id/index' =>'orders#index',as: 'order_index'
    resources :genres
    resources :items
    resources :customers,except: [:new, :create]
    resources :orders,except: [:new, :create, :delete, :edit]

    root :to => 'homes#top'

  end

  namespace :public do

    get '/about' => 'homes#about',as: 'about'
    get '/customers/withdrawal' => 'customers#withdrawal',as: 'withdrawal'
    patch '/customers/withdrawal' => 'customers#breakaway',as: 'breakaway'
    resources :customers,except: [:new, :index, :delete]
    resources :cart_items,except: [:new, :show, :edit]
    resources :items,except: [:new, :create, :delete, :edit]
    resources :addresses,except: [:new, :show]
    resources :orders,except: [:update, :delete, :edit]
    root :to => 'homes#top'

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
