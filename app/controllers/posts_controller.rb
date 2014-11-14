class PostsController < ApplicationController

  before_filter :require_login,only: [:new, :create]


  def index
    @posts=Post.all
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new(customers_posts: params[:comment])
    @post.customer_id= session[:customer_id]
    @post.save

    respond_to do |format|
      format.js
      format.html
    end

  end


  def show
    @post=Post.find(params[:id])
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to posts_list_path
  end

  def popup

  end


  private
  def require_login
    if session[:customer_id].nil?
      flash[:error] = "You must be logged in to post your comments"
      render 'popup' #template: "posts/popup"
    end
  end

end





