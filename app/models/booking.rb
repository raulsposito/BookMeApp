class Booking < ApplicationRecord

    belongs_to :account, :inverse_of => :bookings
    accepts_nested_attributes_for :account
    
    belongs_to :haricut, :inverse_of => :bookings
    accepts_nested_attributes_for :haircut
    
    belongs_to :schedule, :inverse_of => :bookings
    accepts_nested_attributes_for :schedule
    
    belongs_to :barber, :inverse_of => :bookings
    accepts_nested_attributes_for :barber
    
    belongs_to :client, :inverse_of => :bookings
    accepts_nested_attributes_for :client
    
    validates :schedule_id, presence: true
end
