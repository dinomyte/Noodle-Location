class User < ActiveRecord::Base
	
	has_one :post, :dependent => :destroy
	accepts_nested_attributes_for :post, :allow_destroy => true
	validates_uniqueness_of :name, :presence => true
	
	geocoded_by :address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates
	
end
