class User < ApplicationRecord

  has_many :attendances
  has_many :events, through: :attendances
  has_many :event_admin, foreign_key: "administrator_id", class_name: "Event"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send

  def welcome_send
   UserMailer.welcome_email(self).deliver_now
  end

end
