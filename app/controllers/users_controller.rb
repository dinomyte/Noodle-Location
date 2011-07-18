class UsersController < ApplicationController
	
	def index
		@user = User.new
		@user.posts.build
		@json = Post.all.to_gmaps4rails
	end
	
	def list
		@users = User.order('id DESC')
		@posts = Post.order('id DESC')
		@json = Post.all.to_gmaps4rails
	end
	
	def create
		@user = User.new(params[:user])
		
		@location = request.location
		@user[:latitude] = @location.latitude
		@user[:longitude] = @location.longitude
				
		if @user.save
			flash[:notice] = "You have just made a post!"
			redirect_to(:action => 'list')
		else
			render('new')
		end
	end
	
	def edit
		@user = User.find(params[:id])
	end
	
	def update
		@user = User.find(params[:id])
		
		if @user.update_attributes(params[:user])
			flash[:notice] = "You have just updated your post!"
			redirect_to(:action => 'list')
		else
			render('edit')
		end
	end

end
