class ProfilesController < ApplicationController
	def new
		if user_signed_in?
			@user 		= current_user
			@profile 	= @user.build_profile 
		end
	end

	def show
		@profile = Profile.find(params[:id])
	end

	def create
		@user = current_user
		@profile = current_user.build_profile(profile_params)
		if @user == @profile.user || @user.admin?
			respond_to do |format|
				if @profile.save
					format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
	          		format.json { render :show, status: :created, location: @profile }
				else
					format.html { render :new }
	          		format.json { render json: @profile.errors, status: :unprocessable_entity }
				end
			end
		end
	end

	def edit
		@user = current_user if user_signed_in?
		@profile = current_user.profile
	end

	def update
		@user = current_user
		@profile = Profile.find(params[:id])

		respond_to do |format|
			if @user == @profile.user || @user.admin?
				@profile.update_attributes(profile_params)
				if @profile.save
					format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
	      			format.json { render :show, status: :ok, location: @profile }
				else
					format.html { render :edit }
	      			format.json { render json: @profile.errors, status: :unprocessable_entity }
				end
			else
				format.html { redirect_to @profile, notice: 'You must own this profile to edit it.' }
	      		format.json { render :show, status: :unprocessable_entity }
			end
		end
	end

	private
	def profile_params
		params.require(:profile).permit(
			:avatar,
			:skills,
			:description,
			:gender,
			:phone,
			:street_address,
			:postal_code,
			:city,
			:state,
			:country,
			:birthdate,
			:contact_email,
			:language,
			:work,
			:education
		)
	end
end
