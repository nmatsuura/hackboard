class CommentsController < ApplicationController

	before_filter :authenticate_user!

	def create
		post = Post.find(params[:post_id])
		@comment = post.comments.build(params[:comment])
		@comment.user = current_user

		user = post.user

		if @comment.save
			MyMailer.comment_email(user,@comment).deliver
			redirect_to posts_path
		else
			render 'new'
		end
	
		

	end

end
