class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile, :dependent => :destroy
  has_many :events
  has_many :event_volunteers
  validates :email, presence: true

  enum :role => [:admin, :organisation, :volunteer]
end
