class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	has_many :orders
 	has_many :vehicles
 	has_many :delivery_trucks
 	has_many :drivers
 		
 		def admin?
    	role == "admin"
		end

		
		
end
