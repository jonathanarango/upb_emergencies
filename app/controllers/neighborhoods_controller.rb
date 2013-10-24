class NeighborhoodsController < ApplicationController

	autocomplete :neighborhood, :name, :extra_data => [:city_id], :display_value => :complete_location, :full => true
	
end