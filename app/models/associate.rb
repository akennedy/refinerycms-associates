class Associate < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :bio, :contact_info, :listing_link, :email_address]

  validates :name, :presence => true, :uniqueness => true
  
end
