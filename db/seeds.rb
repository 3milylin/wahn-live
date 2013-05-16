require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#CSV.foreach(Rails.public_path + "/data/nyc.csv", :headers => true) do |row|
#	Point.create(
#		:lat => row.to_s.split(/[\n ,]+/).first, 
#		:lng => row.to_s.split(/[\n ,]+/).last
#		)
#end
	
	

CSV.foreach(Rails.public_path + "/data/test-data.csv", :headers => true) do |row|
	temp = row.to_s.split(',')
	
	Venue.create(
		:foursqr_id => temp[0],
		:name => temp[1].tr(?", ?'),
		:lat => temp[2],
		:lng => temp[3],
		:herenow => temp[4],
		:category => temp[5]
		)

end
	
