class SearchController < ApplicationController

  def index
    @customers = CustomersProfile.search(params[:query])

    respond_to do |format|
      format.js
      format.html
    end
  end

end
