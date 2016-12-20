class StaticController < ApplicationController
  def home
		@categories = Event.categories.keys.to_a.map { |r| "<option value='#{r}'>#{r.humanize}</option>" }.join
  end

  def about_us
  end
end
