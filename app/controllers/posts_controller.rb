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
    @post.client_id= current_client.id
    @post.save

    respond_to do |format|
      format.js
      format.html
    end

  end


  def show
    @post=Post.find_by_client_id(current_client.id)
  end

  def destroy
    @post=Post.find_by_client_id(current_client.id)
    @post.destroy
    redirect_to posts_list_path
  end

  def popup

  end


  private
  def require_login
    if current_client.nil?
      flash[:notice] = "You must be logged in to post your comments"
      redirect_to new_client_session_path
     #render template: '/clients/sign_in'
    end
  end

end





