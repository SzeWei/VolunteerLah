class EventVolunteersController < ApplicationController
  #######################
  # => have not start doing, these code are auto-generated
  #######################
  # before_action :set_event_volunteer, only: [:show, :edit, :update, :destroy]

  # # GET /event_volunteers
  # # GET /event_volunteers.json
  # def index
  #   @event_volunteers = EventVolunteer.all
  # end

  # # GET /event_volunteers/1
  # # GET /event_volunteers/1.json
  # def show
  # end

  # # GET /event_volunteers/new
  # def new
  #   @event_volunteer = EventVolunteer.new
  # end

  # # GET /event_volunteers/1/edit
  # def edit
  # end

  # # POST /event_volunteers
  # # POST /event_volunteers.json
  # def create
  #   @event_volunteer = EventVolunteer.new(event_volunteer_params)

  #   respond_to do |format|
  #     if @event_volunteer.save
  #       format.html { redirect_to @event_volunteer, notice: 'Event volunteer was successfully created.' }
  #       format.json { render :show, status: :created, location: @event_volunteer }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @event_volunteer.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /event_volunteers/1
  # # PATCH/PUT /event_volunteers/1.json
  # def update
  #   respond_to do |format|
  #     if @event_volunteer.update(event_volunteer_params)
  #       format.html { redirect_to @event_volunteer, notice: 'Event volunteer was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @event_volunteer }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @event_volunteer.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /event_volunteers/1
  # # DELETE /event_volunteers/1.json
  # def destroy
  #   @event_volunteer.destroy
  #   respond_to do |format|
  #     format.html { redirect_to event_volunteers_url, notice: 'Event volunteer was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_event_volunteer
  #     @event_volunteer = EventVolunteer.find(params[:id])
  #   end

  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def event_volunteer_params
  #     params.require(:event_volunteer).permit(:user_id, :event_id, :status)
  #   end
end
