module ApplicationHelper
	def show_if_org_or_admin?(event)
		if user_signed_in?
		 current_user == event.user || current_user.admin? ? "" : "display:none"
		else
			return "display:none"
		end
	end

	def format_date(event)
		if event.present? && event.start_date == event.end_date
			return event.start_date.strftime("%v (%a)")
		else
			return "#{event.start_date.strftime("%v (%a)")} to  #{event.end_date.strftime("%v (%a)")}"
		end
	end

	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def resource_class
		User
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end
end
