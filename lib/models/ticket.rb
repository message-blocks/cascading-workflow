class Ticket
  include Mongoid::Document
  belongs_to :event
  has_many :ticket_registrations

  field :max_capacity, type: Integer
  field :registration_count, type: Integer
end
