class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(params[:item_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, admin_user_id: current_admin.id, item_id: params[:item_id], admin_item_id: params[:admin_item_id])
  end
end
