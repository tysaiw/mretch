Rails.application.routes.draw do
# get"/", to: "articles#index" 
root "articles#index"
# get "/", to: "articles#index", as "root_path"
get"/about", to: "pages#about"
get"/articles", to: "articles#index"

get"/articles/new", to: "articles#new", as: "new_article" #不用寫path
post"/articles", to: "articles#create"

get"/articles/:id", to: "articles#show", as: "article"
get"/articles/:id/edit", to: "articles#edit", as: "edit_article" #不用寫path
patch"/articles/:id", to: "articles#update"
delete"/articles/:id", to: "articles#destroy"


end
