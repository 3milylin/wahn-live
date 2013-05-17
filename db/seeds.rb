require 'csv'

# populate NYC points 
	#CSV.foreach(Rails.public_path + "/data/nyc.csv", :headers => true) do |row|
	#	Point.create(
	#		:lat => row.to_s.split(/[\n ,]+/).first, 
	#		:lng => row.to_s.split(/[\n ,]+/).last
	#		)
	#end
	
# populate test venues 
	CSV.foreach(Rails.public_path + "/data/test-data.csv", :headers => true) do |row|
		temp = row.to_s.split(',')
		if temp[4].to_i > -1
			if !Venue.find_by_foursqr_id(temp[0]) && 
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
