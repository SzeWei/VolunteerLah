json.extract! event, :id, :title, :description, :start_date, :end_date, :category, :user, :target_space, :event_photos, :status, :created_at, :updated_at
json.url event_url(event, format: :json)