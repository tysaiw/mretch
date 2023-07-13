class ArticlesController < ApplicationController
    def articles
    end

    def new
        @article = Article.new
    end

    def create

        @article = Article.new(article_params)

        if @article.save
            redirect_to "/articles", notice: "文章新增成功"
        else
            #拿new.html.erb
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
    def article_params
        params.require(:article).permit(:title, :content)
    end
end
