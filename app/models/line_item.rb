class LineItem < ApplicationRecord
	belongs_to :vehicle
	belongs_to :order
	belongs_to :truck
end
