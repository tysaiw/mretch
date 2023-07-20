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

resource :users, except: [:show, :destroy] do
    collection do #在單數resource裡 跟 member效果相同(member無效的+id)
        get :login
        post :logining
        delete :logout
        end
    end
end
