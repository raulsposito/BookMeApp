class User < ApplicationRecord
    has_secure_password

    def self.find_or_create_by_google(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
            u.name = auth[:info][:name]
        end
    end
end
