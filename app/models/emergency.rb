class Emergency < ActiveRecord::Base

	#RELATIONS
	belongs_to :emergency_type

  STATUS = {:registered => 1, :revised => 2, :reported => 3 }

	#ATTRIBUTES
  attr_accessible :emergency_type_id, :description, :location_description, :code, :revised_date, :reported_date, :status

	def self.get_emergencies(actual, params)
    parameters = params.clone
    conditions = " archived = 0"
    conditions << " and emergencies.emergency_type_id = :emergency_type_id" if !params[:emergency_type_id].blank?
    conditions << " and emergencies.status = :status" if !params[:status].blank?
    conditions << " and emergencies.neighborhood = :neighborhood" if !params[:neighborhood].blank?
    conditions << " and emergencies.code = :code" if !params[:code].blank?

    return Emergency.where(conditions,parameters)
  end

  def self.graph_by_emergency_neighborhood
  	neighborhoods = Neighborhood.all
	  return Hash[ neighborhoods.map{ |n| [n.name ,Emergency.where("neighborhood_id = #{n.id}").count] } ]
  end

  def self.graph_by_emergency_type
		emergency_types = EmergencyType.all
	  return Hash[ emergency_types.map{ |et| [et.name ,Emergency.where("emergency_type_id = #{et.id}").count] } ]
	end

	def self.graph_by_status
	  return Hash[ STATUS.map{ |s| [Emergency.readable_emergency_status_by_status(s[1]).to_s.to_s ,Emergency.where("status = #{s[1]}").count] } ]
	end

	private 
		def self.readable_emergency_status_by_status(status)
			return if status.blank?
			if(status == STATUS[:registered])
				return "Registrada"
			elsif (status == STATUS[:revised])
				return "Revisada"
			elsif (status == STATUS[:reported])
				return "Reportada"
			end
	end
end
