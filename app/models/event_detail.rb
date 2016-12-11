class EventDetail < ApplicationRecord
  belongs_to :event
  reverse_geocoded_by :latitude, :longitude

  def full_address
    byebug
    query = Geocoder.search("#{self.latitude},#{self.longitude}").first
    if query.nil?
      'not valid'
    else
      query.address
    end
  end
end
