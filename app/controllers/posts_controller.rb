class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_post)
    if @post.save
      redirect_to posts_path, notice: "新增留言成功!"
    else
      render :new
    end
  end

  def edit
    @post = Post.find_by(params[:id])
  end

  def update
    @post = Post.find_by(params[:id])
    if @post.update(params_post)
      redirect_to posts_path, notice: "修改留言成功!"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(params[:id])
    @post.destroy if @post
    redirect_to posts_path, notice: "刪除留言成功!"
  end

  private
  def params_post
    params.require(:post).permit(:title, :content, :nickname)
  end
end
