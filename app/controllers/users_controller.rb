class UsersController < ApplicationController
	
	def index
		@user = User.new
		@post = @user.build_post
		@location = request.location
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
		@user[:address] = @location.address
		@user[:latitude] = @location.latitude
		@user[:longitude] = @location.longitude
		@user.post[:address] = @location.address
		@user.post[:latitude] = @location.latitude
		@user.post[:longitude] = @location.longitude
		
		if @user.save
			flash[:notice] = "Thanks for noodlin!"
			redirect_to(:action => 'list')
		else
			@json = Post.all.to_gmaps4rails
			flash[:notice] = "Error - Please fill the marked fields below!"
			render('index')
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
			@json = Post.all.to_gmaps4rails
			render('edit')
		end
	end

end
