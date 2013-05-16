class VenuesController < ApplicationController

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Venue.all }
    end
    
  end
  
  def update_data 
  
  end 
  
  

end
