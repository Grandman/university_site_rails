class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params.require(:comment).permit(:title, :user_id, :content, :news_id))
    @comment.date = DateTime.current
    @comment.save!
    redirect_to news_path(@comment.news)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.news
  end
end
