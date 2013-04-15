module ApplicationHelper

def byline(object)
		if object.user == current_user
			"Posted by You"
		else
			"Posted by #{object.user.email}"
		end
	end

end
