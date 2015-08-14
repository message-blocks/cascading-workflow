class Registration
  include Mongoid::Document
  include ReservationFlow

  belongs_to :event
  belongs_to :group_registration

  has_many :ticket_registrations
  has_many :session_registrations
end
