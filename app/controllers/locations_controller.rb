class LocationsController < ApplicationController
	layout "private"

  def load_location()
    @city_id = params[:city_id]
    @neighborhood_id = params[:neighborhood_id]
    return if @city_id.to_i <= 0 && @neighborhood_id.to_i <= 0
    @cities = City.list
    @neighborhoods = Neighborhood.list(@city_id)
    respond_to do |format|
      format.html {render  :partial => "partials/load_location" , :layout => false}
    end
  end
end