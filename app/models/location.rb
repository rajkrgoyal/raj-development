class Location < ActiveRecord::Base
  geocoded_by :ip_address, :latitude => :lat, :longitude => :lng, :address=> :address
  after_validation :geocode
  
  reverse_geocoded_by :lat, :lng
  after_validation :reverse_geocode  # auto-fetch address
  
end
