class ArticlesController < ApplicationController
before_action :find_article, only: [:show, :destroy, :edit, :update]
    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:success] = "Article was successfully created!"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end 

    def show

    end 
    
    def destroy
        @article.destroy
        redirect_to articles_path
        flash[:danger] = "Article was successfully deleted."
    end 
    
    def edit
    end
    
    def update
        if @article.update(article_params)
            flash[:success] = "Your article was updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    private
    
    def article_params
        params.require(:article).permit(:title, :description)
    end
    
    def find_article
        @article = Article.find(params[:id])
    end 

end 