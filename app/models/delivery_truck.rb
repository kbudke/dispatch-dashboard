class DeliveryTruck < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :orders
	belongs_to :user


	def set_user!(user)
    self.user_id = user.id

    self.save!
  end
end
