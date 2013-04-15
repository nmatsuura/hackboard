class MyMailer < ActionMailer::Base

	def welcome_email(user)
		@user = user

		mail(to: user.email, 
			from: 'gnome.mats@gmail.com',
			subject: 'Welcome!')
	end

	def comment_email(user, comment)
		@comment = comment

		mail(to: user.email,
			from: 'gnome.mast@gmail.com',
			subject: 'Welcome!')
	end

end