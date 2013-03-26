class Devise::OmniauthCallbacksController < ApplicationController

	def twitter
		auth = env['omniauth.auth']
		uid = auth['uid']
		provider = auth['provider']

		user = User.where(uid: uid, provider: provider).first_or_create do |u|
			u.email = '#{uid}@twitter.com'
		end

		#Block below does same thing as: user = User.where(uid: uid, provider: provider).first_or_create
		# if !user
		# 	user = User.new
		# 	user.uid = uid
		# 	user.provider = provider
		# 	user.save
		# end
	
		sign_in_and_redirect user
	end

end
