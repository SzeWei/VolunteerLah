class EventDetailsController < ApplicationController
  #######################
  # => have not start doing, these code are auto-generated
  #######################
  # before_action :set_event_detail, only: [:show, :edit, :update, :destroy]

  # GET /event_details
  # GET /event_details.json
  def index
  end

  # GET /event_details/1
  # GET /event_details/1.json
  def show
  end

  # GET /event_details/new
  def new
    parent_event
    @event_detail = @event.build_event_detail
  end

  # GET /event_details/1/edit
  def edit
    parent_event
    @event_detail = @event.event_detail
  end

  # POST /event_details
  # POST /event_details.json
  def create
    parent_event
    @event_detail = EventDetail.new(event_detail_params)
    if current_user = @event.user || current_user.admin?
      respond_to do |format|
        if @event_detail.save
          format.html { redirect_to @event_detail, notice: 'Event detail was successfully created.' }
          format.json { render :show, status: :created, location: @event_detail }
        else
          format.html { render :new }
          format.json { render json: @event_detail.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /event_details/1
  # PATCH/PUT /event_details/1.json
  def update
    parent_event
    if current_user = @event.user || current_user.admin?
      respond_to do |format|
        if @event_detail.update(event_detail_params)
          format.html { redirect_to @event_detail, notice: 'Event detail was successfully updated.' }
          format.json { render :show, status: :ok, location: @event_detail }
        else
          format.html { render :edit }
          format.json { render json: @event_detail.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /event_details/1
  # DELETE /event_details/1.json
  def destroy
    @event_detail.destroy
    respond_to do |format|
      format.html { redirect_to event_details_url, notice: 'Event detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def parent_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_detail_params
      params.require(:event_detail).permit(:venue_title, :street_address, :postal_code, :city, :state, :contact_num, :event_id, :day_time, :longitude, :latitude)
    end
end
