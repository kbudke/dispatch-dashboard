json.extract! driver, :id, :driver_name, :driver_id, :driver_dob, :driver_address, :email, :phone_number, :trailer_capacity, :created_at, :updated_at
json.url driver_url(driver, format: :json)