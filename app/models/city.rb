class City < ActiveRecord::Base
  
  has_many :neighborhoods
  belongs_to :state
  
  attr_accessible :name, :state_id

  def self.list
		City.select('id, name').order('name ASC')
	end

end