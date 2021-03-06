Groupsms::Application.routes.draw do

   resources :notifications

   resources :panels
   resources :numbers
   resources :messages
   resources :assignments
   resources :interstatials
   resources :groups
   resources :users
   resources :memberships do
      get 'toggle_activate', :on => :member 
      get 'toggle_activate_admin', :on => :member
   end


   root :to => "users#new"
   get "sessions/new"
   resources :sessions, :only => [:new, :create, :destroy]
   match "/signup",  :to => "users#new"
   match "/signin",  :to => "sessions#new"
   match "/signout", :to => "sessions#destroy"
   match "/nexmo_create", :to => "messages#nexmo_create"
   #match "mediaburst_create" => "messages#mediaburst_create"
   match "/mediaburst_create", :to => "messages#mediaburst_create"
   #match "/messages/mediaburst_create" => "messages#mediaburst_create"

end
