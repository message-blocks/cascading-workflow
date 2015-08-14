class SessionRegistration
  include Mongoid::Document
  include ReservationFlow

  belongs_to :session
  belongs_to :registration
end
