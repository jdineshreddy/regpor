
class LoginsController < ApplicationController
  def new
  end
  def create
      customer = Customer.authenticate(params[:username], params[:password])
      if customer
        session[:customer_id] = customer.id
        flash[:notice] = "Logged in!"
        redirect_to action: :show
      else
        flash[:error] = "Invalid Username or Password"
        render "new"
      end
  end


  def show
    @customer = CustomersProfile.find_by_customer_id( session[:customer_id])
  end




  def destroy
    session[:customer_id] = nil
    flash[:notice]="successfully logged out"
    redirect_to :action => 'new'
  end

  def forgot_password

  end

  def forgot
    user=Customer.find_by_username(params[:username])
    if user
      session[:user_name]=user.username
      flash[:notice]='username exists'
      render "password_change"
    else
      flash[:notice]='Invalid Username'
      redirect_to :action => 'new'
    end
  end

  def password_change

  end

  def update
   cus=Customer.find_by_username(session[:user_name])
    if cus && cus.update(password: params[:password], password_confirmation: params[:password_confirmation])
      flash[:notice]='Password Changed'
      redirect_to :action => 'new'
    else
      flash[:error]='password and connformation password should be same or password length is 6 to 14 characters'
      redirect_to :back
    end
  end

  def deactivate

    @customer=Customer.find(params[:id])
    @customerprofle=CustomersProfile.find_by_customer_id( params[:id])
    @customer.destroy
    @customerprofle.destroyex
    session[:customer_id] = nil
    flash[:notice]='Account Deactivated'
    redirect_to :action => 'new'
  end

end
