class SearchController < ApplicationController

  def index
    @customers = CustomersProfile.search(params[:query])

    respond_to do |format|
      format.js
      format.html
    end
  end

  def assen
    @customer = CustomersProfile.order(:fname)

  end

  def desen
    @customer = CustomersProfile.order(:lname)

  end

end
