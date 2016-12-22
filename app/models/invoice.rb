class Invoice < ApplicationRecord

	def set_user!(user)
    self.user_id = user.id

    self.save!
  end
end
