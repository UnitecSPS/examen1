class Client < ActiveRecord::Base
	has_many :phone_numbers

	def primary_number
		number = phone_numbers.primary.first
		number.present? ? number : "Sin Numero"
	end
end
