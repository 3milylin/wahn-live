require 'csv'

class MapController < ApplicationController
  def index	
  	@venues = Venue.find(:all, :conditions => ['herenow > ?', 0])
  	@peopleCount = Venue.sum("herenow")
  end
end
