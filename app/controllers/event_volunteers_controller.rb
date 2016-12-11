class EventVolunteersController < ApplicationController
  #######################
  # => have not start doing, these code are auto-generated
  #######################
  before_action :set_event_volunteer, only: [:update]
  before_action :parent_event

  # GET /event_volunteers
  # GET /event_volunteers.json
  # def index
  #   parent_event_nested
  #   @event_volunteers = @event.event_volunteers.order("name ASC").paginate(:page => params[:page], :per_page => 30)
  # end

  # GET /event_volunteers/1
  # GET /event_volunteers/1.json
  # def show
  # end

  # GET /event_volunteers/new
  # def new
  # end

  # GET /event_volunteers/1/edit
  # def edit
  # end

  # POST /event_volunteers
  # POST /event_volunteers.json
  def create
    # parent_event
    @event_volunteer = EventVolunteer.new(event_volunteer_params)

    if user_signed_in? & user.volunteer? 
      respond_to do |format|
        unless @event.open?
          gon.response = false
          format.javascript
        elsif @event_volunteer.save
          # format.html { redirect_to @event_volunteer, notice: 'Event volunteer was successfully created.' }
          # format.json { render :show, status: :created, location: @event_volunteer }
          gon.response = true
          format.javascript
        else
          # format.html { render :new }
          # format.json { render json: @event_volunteer.errors, status: :unprocessable_entity }
          gon.response = false
          format.javascript
        end
      end
    end
  end

  # PATCH/PUT /event_volunteers/1
  # PATCH/PUT /event_volunteers/1.json
  def update
    # parent_event
    @event_volunteer = EventVolunteer.find_by(params.require(:event_volunteer).permit(:id))
    if current_user == @event.user || user.admin? 
      respond_to do |format|
        unless @event.open?
          gon.response = false
          format.javascript
        else
          # Note that user should not change anything other than this, so might as well limit it
          @event_volunteer.cancelled!
          gon.response = true
          format.javascript
        end
      end
    end
  end

  # DELETE /event_volunteers/1
  # DELETE /event_volunteers/1.json
  # def destroy
  #   @event_volunteer.destroy
  #   respond_to do |format|
  #     format.html { redirect_to event_volunteers_url, notice: 'Event volunteer was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def parent_event
      @event = Event.find(params[:id])
    end

    def parent_event_nested
      @event = Event.find(params[:event_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_volunteer_params
      params.require(:event_volunteer).permit(:user_id, :event_id)
    end

    def event_volunteer_ids
      params.require(:event_volunteer).permit(:user_id, :event_id)
    end
end
