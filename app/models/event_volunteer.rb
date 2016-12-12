class EventVolunteer < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :email, uniqueness: {:scope => [:name, :phone], message: "You have already volunteered for this event."}
  enum status: { active:0, cancelled:1 }
end
