Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users
  resources :quotes do
    resources :line_item_dates, expect: [:index, :show] do
      resources :line_items, except: [:index, :show]
    end
  end
end
