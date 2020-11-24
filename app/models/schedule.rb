class Schedule < ApplicationRecord

    belongs_to :account, :inverse_of => :schedules
    accepts_nested_attributes_for :account
    
    belongs_to :barber, :inverse_of => :schedules
    accepts_nested_attributes_for :barber
    
    has_many :bookings, :inverse_of => :schedule
    accepts_nested_attributes_for :bookings
    
    validates :start, uniqueness: { scope: :barber_id, message: "You have already made this time available" }
    
#    amoeba do
#      enable
#      exclude_associations :bookings
#    end
end
