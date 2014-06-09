class User < ActiveRecord::Base

  has_many :locations
  has_many :searches
  
  after_create :create_location  
  
  def create_location
    Location.create(:user_id=>self.id, :ip_address => "180.215.217.104")
  end
  
  def self.generate_token
    tracking_code = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless User.exists?(tracking_code: random_token)
    end
  end
  
end
