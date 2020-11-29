class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @post = Post.find(params[:post_id])
    # @comment = @post.comments
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    # @comment.post = @post
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params_comment)
    @comment.post = @post
    if @comment.save
      redirect_to @post, notice: "回覆留言成功"
    else
      render :new
    end
    
  end

  private
  def params_comment
    params.require(:comment).permit(:content)
  end
end
