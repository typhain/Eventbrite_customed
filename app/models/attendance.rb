class Attendance < ApplicationRecord

  belongs_to :user
  belongs_to :event

  after_create :attending_event_send

  def attending_event_send
    UserMailer.attending_event_email(self.event.administrator, self.user).deliver_now
  end

end
