class Result < ActiveModel::Model
	def to_builder
		Jbuilder.new do |result|
			result.result result
			result.data data.to_builder
		end
	end
end
