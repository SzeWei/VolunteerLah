class EventVolunteer < ApplicationRecord
  belongs_to :user
  belongs_to :event
  enum status: { active:0, cancelled:1 }
end
