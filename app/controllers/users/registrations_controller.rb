class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end

  def after_update_path_for(resource)
      user_path(resource)
  end

  private
  # If you have extra params to permit, append them to the sanitizer.
  def sign_up_params
    params.require(:user).permit(:role, :name, :email, :password, :password_confirmation)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, 
      :organisation_profile_attributes => [:id, :name, :field_or_industry, :website, :org_description, :org_size, :language, :phone, :fax, :email, :contact_person, :address, :postal_code, :city, :state, :user_id, :org_photos], 
      :profile_attributes => [:id, :skills, :description, :gender, :phone, :street_address, :postal_code, :city, :state, :country, :birthdate, :contact_email, :language, :work, :education, :avatar] )
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
