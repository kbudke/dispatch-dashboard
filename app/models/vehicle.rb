class Vehicle < ApplicationRecord
  belongs_to :user
	mount_uploader :image, ImageUploader
  before_save :geocode_endpoints
  validates :yearManufactured, :make, :model, :vinNumber, :origin, :destination, presence: true
  


  def set_user!(user)
    self.user_id = user.id

    self.save!
  end

  private

  #To enable Geocoder to works with multiple locations
  def geocode_endpoints
      geocoded = Geocoder.search(:origin).first
      if geocoded
        self.origin_latitude = geocoded.latitude
        self.origin_longitude = geocoded.longitude
      end

      geocoded = Geocoder.search(:destination).first
      if geocoded
        self.destination_latitude = geocoded.latitude
        self.destination_longitude = geocoded.longitude
      end
  end

	def image_from_url(url)
    self.image = open(url)
  end

end
