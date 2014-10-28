class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  def new
    @customer=Customer.new
    @customer.build_customers_profile
  end
  def create
    @customer=Customer.new(customer_params)
    @customer_profile=@customer.customers_profile
    CustomerMailer.welcome_mail(@customer_profile,@customer).deliver
      if @customer.save
        flash[:notice]= " successfully created with."
           redirect_to @customer
      else
        flash[:notice]='account not created please try again'
         render :new

      end
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def list
    @customers=Customer.all
  end



  private
    def customer_params
      params.require(:customer).permit(:username,:password,:password_confirmation,:email,
                                       customers_profile_attributes: [ :fname,:lname,:dob,:gender,:mobile])
    end
end
