class CommentsController < ApplicationController
    def create
      @article = Article.find(params[:article_id])
      comment = @article.comments.new(comment_params)
      comment.user_id = 2
      redirect_to article_path(@article) if comment.save
    end
    # -------------------------
    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article), status: 303
    end
    # ---------------------------
    def show
    end  
    # ---------------------------
    private
    def comment_params
      params.require(:comment).permit(:body, :status)
    end
  end
  