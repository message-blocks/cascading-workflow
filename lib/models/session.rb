class Session
  include Mongoid::Document
  belongs_to :event
  has_many :session_registrations

  field :max_capacity, type: Integer
  field :registration_count, type: Integer
end
