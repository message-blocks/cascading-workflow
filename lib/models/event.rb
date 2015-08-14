class Event
  include Mongoid::Document
  include ReservationFlow
  field :name, type: String
  field :max_capacity, type: Integer
  field :registration_count, type: Integer

  has_many :registrations
end
