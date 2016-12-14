class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
  has_one :profile, :dependent => :destroy
  has_one :organisation_profile, :dependent => :destroy
  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :organisation_profile
  has_many :events
  has_many :event_volunteers
  # has_many :events, through: :event_volunteers
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  enum :role => [:admin, :organisation, :volunteer]
  after_create :build_relevant_profile

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def build_relevant_profile
    if self.volunteer?
      self.build_profile
    elsif self.organisation?
      self.build_organisation_profile
    end
  end
end
