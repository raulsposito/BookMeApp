class Account < ApplicationRecord

    # Users
 has_many :users, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :users
 
 # Barbers
 has_many :barbers, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :barbers
 
 has_many :schedules, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :schedules
 
 # Clients
 has_many :clients, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :clients
 
 # Haircuts
 has_many :bookings, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :bookings
 
end
