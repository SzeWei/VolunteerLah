class ProfilesController < ApplicationController
	def new
		if user_signed_in?
			@user = current_user 
		end
	end

	def create
		@user = current_user
		@profile = current_user.build_profile(profile_params)
		if @profile.save
			redirect_to @profile
			flash[:notice] = "Profile has been saved."
		else
			render "profiles/new"
			flash[:notice] = "Error saving profile."
		end
	end

	def edit
		@user = current_user if user_signed_in?
		@profile = current_user.profile
	end

	def update
		@user = current_user
		@profile = Profile.find(params[:id])

		if @user == @profile.user || @user.admin?
			@profile.update_attributes(profile_params)
			if @profile.save
				redirect_to @profile
				flash[:notice] = "Profile has been saved."
			else
				render "profiles/edit"
				flash[:notice] = "Error saving profile."
			end
		else
			redirect_to @profile
			flash[:alert] = "You can only edit your own profile."
		end
	end

	private
	def profile_params
		params.require(:profile).permit(
			:name,
			:skills,
			:description,
			:gender,
			:phone,
			:street_address,
			:postal_code,
			:city,
			:state,
			:country,
			:birthday,
			:contact_email,
			:language,
			:work,
			:education
		)
	end
end
