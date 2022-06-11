Rails.application.routes.draw do
  namespace :admin do
    resources :jobs
    resources :skills
    resources :candidates
    resources :employees
    resources :interviews
    resources :skill_ratings

    root to: "jobs#index"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
