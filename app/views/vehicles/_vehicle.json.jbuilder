json.extract! vehicle, :id, :name, :make, :model, :yearManufactured, :origin, :destination, :vinNumber, :minimumPossibleWeight, :maximumPossibleWeight, :actualWeight, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
