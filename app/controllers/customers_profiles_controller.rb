class CustomersProfilesController < ApplicationController

  before_action :set_customers_profile, only: [ :show,:edit, :update ]

  def index

  end


  def show

  end

  def edit

  end

  def update
    if @customers_profile.update(customers_profile_params)
      flash[:notice]="Upadated"
      redirect_to @customers_profile
    else
      flash[:notice]='not Updated'
      redirect_to :back
    end

  end



  def subregion_options
    render partial: 'subregion_select'
  end


  private
  def set_customers_profile
    @customers_profile = CustomersProfile.find_by_customer_id(session[:customer_id])
  end

  def customers_profile_params
    params.require(:customers_profile).permit(:fname, :lname, :email, :dob, :mobile, :address,:country, :state, :gender)
  end

end



