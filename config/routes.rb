Rails.application.routes.draw do
  resources :applicants
  resources :interviewers
  resources :interviews

  get '/interviewers/:id/interview/', to: "interviewers#interview", as: "create_interview"
  post '/interviews/:id', to: "interviews#change_status", as: "change_status"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
