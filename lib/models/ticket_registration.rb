class TicketRegistration
  include Mongoid::Document
  include ReservationFlow

  belongs_to :ticket
  belongs_to :registration
end
