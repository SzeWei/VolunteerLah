class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :title, presence: true
  validates :text, presence: true
end
