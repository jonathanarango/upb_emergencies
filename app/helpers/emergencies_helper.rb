module EmergenciesHelper

	def get_status
		return { 	"Registrada" => Emergency::STATUS[:registered],
							"Revisada" => Emergency::STATUS[:revised],
							"Reportada" => Emergency::STATUS[:reported]
						}
	end

	def get_emergency_status(value)
		case value
		when Emergency::STATUS[:registered]
			"Registrada"
		when Emergency::STATUS[:revised]
			"Revisada"
		when Emergency::STATUS[:reported]
			"Reportada"
		end
	end

end
