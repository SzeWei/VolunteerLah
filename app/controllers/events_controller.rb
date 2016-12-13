class EventsController < ApplicationController
  # before_action :set_event, only: [:show, :edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index
    # category = params[:category] || ''
    # city = params[:city] || ''
    # start_date = params[:start_date] || ''
    # end_date = params[:end_date] || ''
    # query = params[:query] || ''
    # latitude = params[:latitude].to_f || ''
    # longitude = params[:longitude].to_f || ''
    # current_user_id = current_user.id || ''

    # @events = Event
    # @events = @events.the_category(category) if category.present?
    # @events = @events.city(city) if city.present?
    # @events = @events.start_date(start_date) if start_date.present?
    # @events = @events.end_date(end_date) if end_date.present?
    # @events = @events.search(query) if query.present?
    # @events = @events.status_open(current_user_id)
    # @events = @events.near(latitude,longitude) if latitude.present? && longitude.present?
    # @events = @events.includes(:event_detail).reorder("created_at DESC").paginate(:page => params[:page])

    # Filters Events according to given parameters
    filter_params = params.slice(:category, :city, :start_date, :end_date, :search, :near)
    filter_params.merge(:status_open => current_user.id) if user_signed_in?
    # Calls method Event#filter from "app/models/concerns/filterable.rb"
    @events = Event.filter(filter_params)
    # Paginate Events index
    @events = Event.order("created_at DESC").paginate(page: params[:page], per_page: 30)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    set_event
    @event_detail = @event.event_detail
    @event_volunteer = @event.event_volunteers.new
  end

  # GET /events/new
  def new
    @event = current_user.events.new
    @event.build_event_detail
  end

  # GET /events/1/edit
  def edit
    set_event
  end

  # POST /events
  # POST /events.json
  def create
    respond_to do |format|
      if current_user.organisation? || current_user.admin?
        @event = Event.new(event_params)
          if @event.save
            format.html { redirect_to @event, notice: 'Event was successfully created.' }
            # format.json { render :show, status: :created, location: @event }
          else
            format.html { render :new }
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
      else
        format.html { redirect_to root_path, notice: 'You must be an organisation to post an event.' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if current_user.organisation? || current_user.admin?
      if ( current_user == @event.user || current_user.admin? ) && @event.open? 
        respond_to do |format|
          if @event.update(event_params)
            format.html { redirect_to @event, notice: 'Event was successfully updated.' }
            format.json { render :show, status: :ok, location: @event }
          else
            format.html { render :edit }
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
      end
    else
      format.html { redirect_to root_path, notice: 'You must be an organisation to post an event.' }
      format.json { render json: @event.errors, status: :unprocessable_entity }
    end
  end

  def getnear
    latitude = params[:latitude] || ''
    longitude = params[:longitude] || ''
    category = params[:category] || ''

    respond_to do |format|
      unless latitude.present? && longitude.present? && category.present?
        # 400 = Bad Request
        format.html { redirect_to root_path }
        @status = { code: 400, error: 'Invalid category, latitude or longitude'}
        gon.status = @status
        @event = nil
        format.js
        format.html
      end
      @status = { code: 200 }
      @events = Event.where(category: category).near(latitude.to_f, longitude.to_f).includes(:event_detail).where(status: :open).where(['Event.end_date > ?', Date.today]).all
      gon.status = @status
      gon.events = @events

      format.html
      format.js
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    if current_user.admin? || current_user == @event.user
      @event.destroy
      respond_to do |format|
        format.html { redirect_to events_url, notice: 'Event was successfully deleted.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_date, :end_date, :category, :user, :target_space, {event_photos: []}, :status, 
        :event_detail_attributes => [:id, :venue_title, :street_address, :postal_code, :city, :state, :contact_num, :event_id, :day_time, :longitude, :latitude])
    end
end
