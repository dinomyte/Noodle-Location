class User < ActiveRecord::Base
	
	has_many :posts
	accepts_nested_attributes_for :posts
	validates_presence_of :name
	
end
