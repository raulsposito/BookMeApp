class User < ApplicationRecord
    has_secure_password

    validates :name, presence: :true
    validates :email, presence: :true

    has_many :bookings
    has_many :barbers ,through: :bookings

    def self.find_or_create_by_google(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
            u.name = auth[:info][:name]
        end
    end
end
