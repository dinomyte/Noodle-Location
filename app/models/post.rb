class Post < ActiveRecord::Base
	
	acts_as_gmappable :lat => 'latitude', :lng => 'longitude', :address => "address", :normalized_address => "address" 
	
	belongs_to :user
	validates_presence_of :content
	
end
