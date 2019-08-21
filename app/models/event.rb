class Event < ApplicationRecord

  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :administrator, class_name: "User"

end
