class ArticlesController < ApplicationController
    before_action :set_article, only: [:show]

    before_action :set_user_article, only: [ :edit, :update, :destroy]
    #=before_action : set_article, except: [:index, :new, :create]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        #eager loading
        @articles = Article.includes(:user).order(id: :desc)
    end
    
    def articles
    end

    def show

            #Article.where(id:n) #return [] 找一群資料
            #Article.find_by(id:n) #找單筆資料
            # render html: @article.title
        # rescue ActiveRecord::RecordNotFound
        #     not_found
    end

    def new
        @article = Article.new            
    end

    def create

        @article = current_user.articles.new(article_params)
        #@article.user = current_user
        #@article.user_id = current_user.id


        if @article.save
            redirect_to articles_path, notice: "文章新增成功"
        else
            #拿new.html.erb
            flash[:alert] = "有東西沒填喔"
            render:new
        end

        
        # flash[notice] = "文章新增成功"
        # flash[:alert] = ""
        #ORM object relation mapping
        #strong parameter
        # clean_params = params.require(:article).permit(:title, :content)
        # article = Article.new(clean_params)
        # article.save

        # article = Article.new(title: params[:cc][:title],
        #                         content: params[:cc][:content])
        #                         article save
    end

    def edit
    end

    def update
        if @article.update(article_params)
            redirect_to articles_path, notice: "更新成功"
        else
            render :edit
        end
    end
    
    def destroy
        @article.destroy
        redirect_to articles_path, notice: "刪除成功"
    end

    private

    def article_params
        params.require(:article)
                .permit(:title, :content, :sub_title)
                #.merge(user: current_user, a:1, b:2)
    end

    def set_article
        @article = Article.find(params[:id])
    end

    def set_user_article
        @article = current_user.articles.find(params[:id])
    end
end