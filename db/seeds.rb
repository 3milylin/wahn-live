require 'csv'

# populate NYC points 
if Point.all.count == 0
	CSV.foreach(Rails.public_path + "/data/nyc.csv", :headers => true) do |row|
		Point.create(
			:lat => row.to_s.split(/[\n ,]+/).first, 
			:lng => row.to_s.split(/[\n ,]+/).last
			)
	end
end	
	
# populate test venues 
if Venue.all.count == 0
	CSV.foreach(Rails.public_path + "/data/test-data.csv", :headers => true) do |row|
		temp = row.to_s.split(',')
		if !Venue.find_by_foursqr_id(temp[0])
			Venue.create(
				:foursqr_id => temp[0],
				:name => temp[1].tr(?", ?'),
				:lat => temp[2],
				:lng => temp[3],
				:herenow => temp[4],
				:category => temp[5]
				)
		end 
	end
end 
