module PostsHelper

	def comment_byline(post)
		if post.user == post_user
			"Posted by You"
		else
			"Posted by #{post.user.email}"
		end
	end

end
