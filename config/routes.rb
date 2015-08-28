Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :abandoned_orders, only: [:index, :show, :destroy] do
      collection do
        post :update_positions
      end
    end
  end
end
