class ArticlesController < ApplicationController
  
  
  def new
    @article = Article.new  
  end
  
  def create
    @article = Article.new(article_params)
    
    #Checks to see if validations passed
    if @article.save
      flash[:notice] = "Article was successfully created" #shows message to creator 
      redirect_to article_path(@article)
    else
      render :new
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    
    end
  
end