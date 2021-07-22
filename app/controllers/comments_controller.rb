class CommentsController < ApplicationController

  def index
    comments = Roast.find(params[:roast_id]).comment
    render json: {status: 200, comments: comments}
  end

  def new 
    comment = Comment.new
  end

  def destroy
    roast = Roast.find(params[:roast_id])
    comment = roast.comment.find(params[:id])
    comment.destroy
    redirect_to roast_path(roast)
  end

  def update 
    comment = Comment.find(params[:id])
    comment.update(comment_params)
    render(json: {comment: comment}) 
  end

  def create 
  roast = Roast.find(params[:roast_id])
  comment = roast.comment.create(comment_params)
  redirect_to roast_path(roast)
  end

  def show 
    @comment = Comment.find(params[:id])
    render json: {status: 200, comment: @comment}
  end
  
  private 
  def comment_params
    params.permit(:name, :author, :body, :roast_id)
  end
end
