class PostsController < ApplicationController
	
	def index
		list
		render('list')
	end
	
	def list
		@posts = Post.order('id DESC')
	end
	
	def show
		@post = Post.find(params[:id])
	end
	
	def new
		@post = Post.new
	end
	
	def create
		@post = Post.new(params[:post])
		
		if @post.save
			flash[:notice] = "You have just made a post!"
			redirect_to(:action => 'list')
		else
			render('new')
		end
	end
	
	def edit
		@post = Post.find(params[:id])
	end
	
	def update
		@post = Post.find(params[:id])
		
		if @post.update_attributes(params[:post])
			flash[:notice] = "You have just updated your post!"
			redirect_to(:action => 'list')
		else
			render('edit')
		end
	end
	
end
