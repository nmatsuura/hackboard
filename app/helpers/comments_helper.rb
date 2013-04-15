module CommentsHelper

	def comment_byline(comment)
		if comment.user == current_user
			"Posted by You"
		else
			"Posted by #{comment.user.email}"
		end
	end
end
