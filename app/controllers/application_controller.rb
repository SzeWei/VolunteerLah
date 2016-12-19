class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, with: :exception
  before_action :authenticate_user!, :except => [:show, :index, :home, :about_us]
  respond_to :html, :json
end
