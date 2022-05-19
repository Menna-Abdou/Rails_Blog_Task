class ArticlesController < ApplicationController
  #refactoring to code prevent repeat
  # before_action :set_article, only: [:show, :edit, :update, :destroy]
  def index
    # @ >> instance variable
    @articles = Article.all
  end
   # -----------------------------
  def show
    @article = Article.find(params[:id])
  end  
  # --------------------------------
  def new
    @article = Article.new
  end  
  # -----------------------------
  def create
    @article = Article.new(article_params)
    # @article.save
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
    # render plain: params
  end  
   # -----------------------------
   def edit
    @article = Article.find(params[:id])
  end  
   # -----------------------------
   def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end  
   # -----------------------------
   def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
    # @article = Article.find(params[:id])
    # redirect_to articles_path if @article.destroy
   end  
   # -----------------------------
  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
  # --------------------------------------------------
  #this method to repeat this line in all methods
  # def set_article
  #   @article = Article.find(params[:id])
  # end  
end
