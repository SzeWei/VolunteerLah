class Event < ApplicationRecord
  belongs_to :user
  enum category: { homeless: 0, elderies: 1, animals: 2 }
  enum status: { open:0, cancelled: 1, expired:2 }
  has_one :event_detail
  has_many :event_volunteers

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true, date: { after_or_equal_to:  :start_date}
  validates :category, presence: true
  scope :category, -> (category) { where category: category }
  scope :city, -> (city) { joins( :event_detail ).where( :event_details => { :city => city } ) }
  scope :status_open, -> { where(status: :open) }
  scope :start_date, -> (start_date) { where("end_date > ? AND end_date > ?"), start_date, Date.yesterday }
  scope :end_date, -> (end_date) { where("start_date < ? AND end_date > ?"), end_date, Date.yesterday }

  include pg_search_scope :search_string, against: [:title, :description], using: {tsearch: {dictionary: "english"}}



end
