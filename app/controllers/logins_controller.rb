
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
    user=CustomersProfile.find_by_email(params[:email])
    if user
      user.send_password_reset

      #sessions[:user_id] =user.customer_id
      #@email=user.email
      #CustomerMailer.pw_change(@email).deliver
      flash[:notice]='Password sent to your Email'
      redirect_to :action => 'new'
      #render "password_change"
    else
      flash[:notice]="Email does'nt exists"
      redirect_to :back
    end
  end

  def password_change
    @user = Customer.find_by_password_reset_token!(params[:id])
  end

  def update

    @user = Customer.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to logins_forgot_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(params[:user])
      redirect_to log_in_path, :notice => "Password has been reset!"
    else
      render :password_change
    end

   #cus=Customer.find_by(session[:userid])


    #if cus && cus.update(password: params[:password], password_confirmation: params[:password_confirmation])
    #  flash[:notice]='Password Changed'
    #  redirect_to :action => 'new'
    #else
     # flash[:error]='password and connformation password should be same or password length is 6 to 14 characters'
      #redirect_to :back
    #end
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
