class EmergencyType < ActiveRecord::Base
  
  #RELATIONS
  belongs_to :emergency

  attr_accessible :name

end