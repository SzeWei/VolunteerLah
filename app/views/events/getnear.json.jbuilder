
json.status(@status)

unless @events.empty?
  json.events do
    json.array! @events do |event|
      json.title event.title
      json.description event.description
      json.start_date event.start_date
      json.end_date event.end_date
      json.category event.category
      json.latitude event.event_detail.latitude
      json.logitude event.event_detail.longitude
    end
  end
end 