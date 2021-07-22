class CommentsController < ApplicationController

  def index
    comments = Comment.all
    render json: {status: 200, comments: comments}
  end
end
