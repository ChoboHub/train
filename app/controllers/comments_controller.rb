class CommentsController < ApplicationController

  def create
    @comment = @resource.comments.create(params[:comment])
    redirect_to post_path(@resource)
  end

  def destroy
    @comment = @resource.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@resource)
  end

  def set_resource
    @resource ||= Post.find(params[:post_id])
  end
end
