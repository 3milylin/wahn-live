require 'csv'

class MapController < ApplicationController
  def index	
  	@venues = Venue.find(:all, :conditions => ['herenow > ?', 0])
  	@peopleCount = Venue.sum("herenow")
  	@lastUpdated = Venue.maximum("updated_at")
  	
  end
end
