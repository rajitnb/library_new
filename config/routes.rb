Rails.application.routes.draw do
  get 'home_page/index'
  devise_for :librarians , controllers:{sessions: 'librarians/sessions', registrations: 'librarians/registrations'}
  devise_for :students, controllers:{sessions: 'students/sessions',registrations: 'students/registrations'}
  devise_for :admins , controllers: {sessions: 'admins/sessions', registrations: 'admins/registrations'}
  get 'signup', to: 'users#new' , as:'signup'
  get 'login', to: 'sessions#new', as:'login'
  get 'logout', to:'sessions#destroy', as: 'logout'
  
  resources :users
  resources :sessions
  resources :admins
  resources :librarians
  resources :students
  resources :bookmarks
  resources :book_histories
  resources :libraries

  
  root to: 'home_page#index'
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
