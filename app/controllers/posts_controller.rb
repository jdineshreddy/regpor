class PostsController < ApplicationController

  before_filter :require_login,only: [:new]


  def index
   @posts=Post.all
  end

  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.customer_id= session[:customer_id]

    if @post.save
      redirect_to posts_list_path
      #redirect_to show_posts_path(id: @post.id)
    else
      render "new"
    end
  end


  def show
  @post=Post.find(params[:id])
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    flash[:notice]='Deleted'
    redirect_to posts_list_path
  end

  def popup

  end

  private
   def post_params
     params.require(:post).permit(:customers_posts)
   end


  private
  def require_login
    if session[:customer_id].nil?
      flash[:error] = "You must be logged in to post your comments"
      render 'popup' #template: "posts/popup"
    end
  end

end





