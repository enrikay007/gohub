module ApplicationHelper
	def avatar_url(user)
		if user.image
			user.image
		else
			"/images/missing.png"
		end
	end
end