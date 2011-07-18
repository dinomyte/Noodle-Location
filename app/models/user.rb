class User < ActiveRecord::Base
	
	has_many :posts, :dependent => :destroy
	accepts_nested_attributes_for :posts, :allow_destroy => true
	validates_presence_of :name
	
end
