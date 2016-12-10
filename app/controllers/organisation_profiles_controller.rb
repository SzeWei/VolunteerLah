class OrganisationProfilesController < ApplicationController
  before_action :set_organisation_profile, only: [:show, :edit, :update, :destroy]

  # GET /organisation_profiles
  # GET /organisation_profiles.json
  def index
    @organisation_profiles = OrganisationProfile.all
  end

  # GET /organisation_profiles/1
  # GET /organisation_profiles/1.json
  def show
    set_organisation_profile
  end

  # GET /organisation_profiles/new
  def new
    @user = current_user
    @organisation_profile = @user.build_organisation_profile
  end

  # GET /organisation_profiles/1/edit
  def edit
    set_organisation_profile
  end

  # POST /organisation_profiles
  # POST /organisation_profiles.json
  def create
    if current_user.organisation?
      @organisation_profile = current_user.build_organisation_profile(organisation_profile_params)
      if current_user = @organisation_profile.user || current_user.admin?
        respond_to do |format|
          if @organisation_profile.save
            format.html { redirect_to @organisation_profile, notice: 'Organisation profile was successfully created.' }
            format.json { render :show, status: :created, location: @organisation_profile }
          else
            format.html { render :new }
            format.json { render json: @organisation_profile.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # PATCH/PUT /organisation_profiles/1
  # PATCH/PUT /organisation_profiles/1.json
  def update
    set_organisation_profile
    if current_user = @organisation_profile.user || current_user.admin?
      respond_to do |format|
        if @organisation_profile.update(organisation_profile_params)
          format.html { redirect_to @organisation_profile, notice: 'Organisation profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @organisation_profile }
        else
          format.html { render :edit }
          format.json { render json: @organisation_profile.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /organisation_profiles/1
  # DELETE /organisation_profiles/1.json
  def destroy
    set_organisation_profile
    if current_user = @organisation_profile.user || current_user.admin?
      @organisation_profile.destroy
      respond_to do |format|
        format.html { redirect_to organisation_profiles_url, notice: 'Organisation profile was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organisation_profile
      @organisation_profile = OrganisationProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organisation_profile_params
      params.require(:organisation_profile).permit(:name, :field_or_industry, :website, :org_description, :org_size, :language, :phone, :fax, :email, :contact_person, :address, :postal_code, :city, :state, {org_photos: []})
    end
end
