require 'csv'

class Venue < ActiveRecord::Base
  attr_accessible :foursqr_id, :category, :herenow, :lat, :lng, :name
  
  def nyc_points
	

  end 
  
  
  
end
