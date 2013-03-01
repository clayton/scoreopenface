Scoreopenface::Application.routes.draw do
  resources :games do
    resources :scored_hands
  end

  root :to => 'games#new'
end
