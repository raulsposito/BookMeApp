class Haircut < ApplicationRecord
    has_many :barbers, :through => :bookings
  
    has_many :clients, :through => :bookings
    
    has_many :bookings, :inverse_of => :haircut
    accepts_nested_attributes_for :bookings

    def self.set_duration
        @haircut.duration = 1.hour
    end
end
