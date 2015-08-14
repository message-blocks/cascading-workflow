class GroupRegistration
  include Mongoid::Document
  has_many :registrations

  field :name, type: String
end
