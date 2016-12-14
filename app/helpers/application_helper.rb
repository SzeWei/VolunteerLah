module ApplicationHelper
	def show_if_org_or_admin?(event)
		if user_signed_in?
		 current_user == event.user || current_user.admin? ? "" : "display:none"
		else
			return "display:none"
		end
	end
end
