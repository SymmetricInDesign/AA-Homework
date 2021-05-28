class User < ApplicationRecord
    attr_reader :password
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: {message: "password can't be blank"}, allow_nil: true

    validates :password, length: {minimum: 6}

    after_initialize :ensure_session_token
    # before_validation :ensure_session_token



    def self.find_by_credentials(username, password)
        user=User.find_by(username: username)
        if user && user.is_password?(password)
            user
        else
            nil
        end

    end

    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest) #creates a new password object with password_digest
        password_object.is_password?(password) #NOT a recursive call.
    end


    def password=(pass)
        self.password_digest = BCrypt::Password.create(pass)
        @password = pass
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end


end
