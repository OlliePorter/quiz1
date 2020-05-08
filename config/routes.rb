Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'quizzes#index'
  resources :quizzes do
    resources :questions do
      resources :question_answers
    end
  end
end
