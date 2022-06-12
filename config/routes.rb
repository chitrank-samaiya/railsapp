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

  resources :employees, except: [:destroy]
  resources :candidates, except: [:destroy] do
    collection do
      get :reports
    end
  end
  resources :interviews, except: [:destroy]
  resources :jobs, except: [:destroy]

  root to: "admin/jobs#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
