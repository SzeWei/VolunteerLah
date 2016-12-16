json.extract! comment, :id, :title, :text, :rating, :user_id, :event_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)