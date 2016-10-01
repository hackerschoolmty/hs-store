class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comments_params)
    @comment.save
    NotificationJob.set(wait: 1.minute).perform_later(@comment.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comments_params
    params.require(:comment).permit(:user_id, :product_id, :description)
  end
end
