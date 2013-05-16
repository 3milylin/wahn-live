      //initiate leaflet map
      var map = new L.Map('map', { 
        center: [40.7542, -73.9600],
        zoom: 13
      })

      L.tileLayer('http://{s}.tiles.mapbox.com/v2/sw2279.NewYork/{z}/{x}/{y}.png', {
        attribution: 'MapBox'
      }).addTo(map);
      
      var layerUrl = 'http://sw2279.cartodb.com/api/v1/viz/2612/viz.json';

      var layerOptions = {
            query: "SELECT * FROM update WHERE time_queried = (SELECT max(time_queried) FROM update)"
      }

	  var layers = [];

	  var LayerActions = {
		  all: function(){
			layers[0].setQuery("SELECT * FROM update WHERE time_queried = (SELECT max(time_queried) FROM update)");
			return true;
		  },
		  arts_entertainment: function(){
			layers[0].setQuery("SELECT * FROM update WHERE parent_category = 'arts_entertainment' AND time_queried = (SELECT max(time_queried) FROM update)");
			return true;
		  },
		  education: function(){
			layers[0].setQuery("SELECT * FROM update WHERE parent_category = 'education' AND time_queried = (SELECT max(time_queried) FROM update)");
			return true;
		  },
		  food: function(){
			layers[0].setQuery("SELECT * FROM update WHERE parent_category = 'food' AND time_queried = (SELECT max(time_queried) FROM update)");
			return true;
		  },
		  building: function(){
			layers[0].setQuery("SELECT * FROM update WHERE parent_category = 'building' AND time_queried = (SELECT max(time_queried) FROM update)");
			return true;
		  },
		  nightlife: function(){
			layers[0].setQuery("SELECT * FROM update WHERE parent_category = 'nightlife' AND time_queried = (SELECT max(time_queried) FROM update)");
			return true;
		  },
		  residences: function(){
			layers[0].setQuery("SELECT * FROM update WHERE parent_category = 'residences' AND time_queried = (SELECT max(time_queried) FROM update)");
			return true;
		  },
		  parks_outdoors: function(){
			layers[0].setQuery("SELECT * FROM update WHERE parent_category = 'parks_outdoors' AND time_queried = (SELECT max(time_queried) FROM update)");
			return true;
		  },
		  shops: function(){
			layers[0].setQuery("SELECT * FROM update WHERE parent_category = 'shops' AND time_queried = (SELECT max(time_queried) FROM update)");
			return true;
		  },
		  travel: function(){
			layers[0].setQuery("SELECT * FROM update WHERE parent_category = 'travel' AND time_queried = (SELECT max(time_queried) FROM update)");
			return true;
		  }
	  };
		
	  cartodb.createLayer(map, layerUrl, layerOptions)
		  .on('done', function(layer) {
			map.addLayer(layer);
			layers.push(layer);
	            /*$("#minSinceUpdate").text(
	                    Math.floor((Math.abs(new Date() - new Date(Date.parse(map.updated_at)))) / (1000*60))
	            );*/       
		  }).on('error', function() {
		  //log the error
	  });

      
      $('.button').click(function(){
		  $('.button').removeClass('selected');
		  $(this).addClass('selected');	
		  LayerActions[$(this).attr('id')]();
		});
