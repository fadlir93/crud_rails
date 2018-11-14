class ArticlesController < ApplicationController
    #this method function is to show all result data
    def index
        @articles = Article.all
    end
    
    # show result data when submit
    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = Article.new
    end

    # edit data
    def edit
        @article = Article.find(params[:id])
    end

    #when form.submit(new.html.erb) on click method create will do something 
    def create
        # render plain: params[:article].inspect
        
        @article = Article.new(article_params)
        
        if @article.save
           redirect_to @article
        else
            render 'new'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to articles_path
    end

    #function for edit data
    def updated
        @article = Article.find([param[:id]])
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    #make method private to make sure it can't be called outside its intended context
    private
        #function for submit need |params.require(:article) as name table| permit(:title, :text) as name column  
        def article_params
            params.require(:article).permit(:title, :text)
        end

end
