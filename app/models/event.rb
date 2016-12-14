class Event < ApplicationRecord
  belongs_to :user
  enum category: { homeless: 0, elderly: 1, animals: 2 }
  enum status: { open:0, cancelled: 1, expired:2 }
  has_one :event_detail, dependent: :destroy
  accepts_nested_attributes_for :event_detail
  has_many :event_volunteers
  # has_many :users, through: :event_volunteers
  mount_uploaders :event_photos, EventPhotosUploader
  include Filterable

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true, date: { after_or_equal_to:  :start_date}
  validates :category, presence: true
  scope :the_category,    -> (category) { where category: category }
  scope :city,        -> (city) { joins( :event_detail ).where( :event_details => { :city => city } ) }
  # status open will limit the result to be opening status only,
  # but still allowed cancelled result to show when user are requested for the event
  scope :status_open, -> (uid) { left_joins(:event_volunteers).where(["(events.status = ? OR event_volunteers.user_id = ? )", 0, uid ]) }
  scope :near, -> (latitude, longitude) { where('events.id in (?)', EventDetail.near([latitude,longitude], 5, :units => :km, :order => false).pluck(:event_id)) }
  scope :start_date,  -> (start_date) { where("start_date > ? AND end_date > ?", start_date, Date.yesterday) }
  scope :end_date,    -> (end_date) { where("start_date < ? AND end_date > ?", end_date, Date.yesterday) }

  include PgSearch
  pg_search_scope :search, against: [:title, :description], using: {tsearch: {dictionary: "english"}}

  
end
