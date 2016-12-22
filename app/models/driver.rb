class Driver < ApplicationRecord
	belongs_to :user
	mount_uploader :image, ImageUploader


  def set_user!(user)
    self.user_id = user.id

    self.save!
  end
end
