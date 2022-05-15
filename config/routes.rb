Rails.application.routes.draw do
  
  devise_for :users
  root 'pages#home'
  resources :books do 
    resources :reviews
  end
  post "/books/:book_id/send_email", to: "books#send_email"


end

