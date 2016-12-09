json.extract! event_volunteer, :id, :user_id, :event_id, :status, :created_at, :updated_at
json.url event_volunteer_url(event_volunteer, format: :json)