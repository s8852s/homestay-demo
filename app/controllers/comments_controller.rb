class CommentsController < ApplicationController

  def index
    @comments = Comments.all
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    
  end
end
