class PhoneNumber < ActiveRecord::Base
  belongs_to :client

  scope :primary, -> { where(primary: true) }
  after_save :ensure_primary

  private
  	def ensure_primary
  		if self.primary?
  			self.client.phone_numbers.primary.where("id != ?",self.id).update_all(primary: false)
  		end
  	end
end
