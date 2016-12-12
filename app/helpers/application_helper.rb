module ApplicationHelper
	def show_if_org_or_admin?(event)
		current_user == event.user || current_user.admin? ? "" : "display:none"
	end
end
