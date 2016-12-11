class EventDetail < ApplicationRecord
  belongs_to :event
  reverse_geocoded_by :latitude, :longitude

  def full_address
    Geocoder.search("#{latitude},#{longitude}").first.address
  end
end
