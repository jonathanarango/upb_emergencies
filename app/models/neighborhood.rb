class Neighborhood < ActiveRecord::Base

  belongs_to :city

  attr_accessible :name, :city_id

  def self.list(city_id)
		Neighborhood.select('id, name').where("city_id = ?", city_id).order('name ASC')
  end

  def complete_location
		@city = City.find(self.city_id)
		"#{self.name} - #{@city.name}"
	end

end