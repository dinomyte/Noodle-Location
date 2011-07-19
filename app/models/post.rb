class Post < ActiveRecord::Base
	
	acts_as_gmappable
	
	belongs_to :user
	validates_presence_of :content
	
	def gmaps4rails_infowindow
      # add here whatever html content you desire, it will be displayed when users clicks on the marker
      "<h2>#{user.name}</h2><p class='info_window'>#{content}</p>"
    end
    
    def gmaps4rails_title
      # add here whatever text you desire
      "#{user.name}"
    end
    	
end
