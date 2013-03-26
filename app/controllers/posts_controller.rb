class PostsController < ApplicationController

	before_filter :authenticate_user!

	def index
		#render text: params.to_s
		user_id = params[:user_id]
		if user_id
			@posts = Post.includes(:comments).where(user_id: user_id)
		else
			@posts = Post.includes(:comments).all
		end
	end

	def new
		@post = Post.new
	end

	def create

		@post = current_user.posts.build(params[:post])

		# @post = Post.new(params[:post])
		if @post.valid?
			@post.save
			redirect_to posts_path
		else
			render :new
		end
	end

	def mine
		@posts = current_user.posts
		render :index
	end

end
