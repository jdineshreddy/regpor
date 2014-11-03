
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
     if session[:customer_id].nil?
      render "new"
    else
    @customer = CustomersProfile.find_by_customer_id( session[:customer_id])
     end
  end




  def destroy
    session[:customer_id] = nil
    flash[:notice]="Successfully logged out"
    redirect_to :action => 'new'
  end

  def forgot_password

  end

  def forgot
    user=Customer.find_by_email(params[:email])
    if user
      user.send_password_reset
      flash[:notice]='Password sent to your Email'
      redirect_to :action => 'new'
    else
      flash[:notice]="Email does'nt exists"
      redirect_to :back
    end
  end

  def password_change
    if Customer.where(password_reset_token: params[:id]).exists?(conditions = :none)
      @user = Customer.find_by_password_reset_token!(params[:id])
    else
    flash[:notice]='Password already changed'
    render 'new'
    end
  end

  def update
    @user = Customer.find_by_password_reset_token!(params[:id])
    if @user.update(password: params[:password], password_confirmation: params[:password_confirmation])
      @user.update(password_reset_token: nil)
      redirect_to log_in_path, :notice => "Password has been reset!"
    else
      render :password_change
    end
  end

  def psword_change_for_login_customer

  end

  def pd_update_for_login_customers
    cus=Customer.find_by(session[:userid])
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
    @customerprofle.destroy
    session[:customer_id] = nil
    flash[:notice]='Account Deactivated'
    redirect_to :action => 'new'
  end

end
