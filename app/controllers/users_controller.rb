class UsersController < ApplicationController
	
	def index
		@user = User.new
		@user.posts.build
	end
	
	def list
		@users = User.order('id DESC')
	end
	
	def create
		@user = User.new(params[:user])
		
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
