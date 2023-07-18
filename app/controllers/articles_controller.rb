class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    #=before_action : set_article, except: [:index, :new, :create]

    def index
        @articles = Article.all.order(id: :desc)
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
        p "4"*100
        p @article
    end

    def create

        @article = Article.new(article_params)

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
        params.require(:article).permit(:title, :content, :sub_title)
    end

    def set_article
        @article = Article.find(params[:id])
    end
end