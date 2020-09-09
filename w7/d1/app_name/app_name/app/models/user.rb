# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    attr_reader :password
    
    validates :username, presence: {message: "cant't be blank"}
    validates :password, length: {minimum: 6, allow_nil: true}
    validates :password_digest, presence: true

    before_validation :ensure_session_token
    #SPIRE
    def self.find_by_credentials(uname,pword)
        user = User.find_by(username: uname)
        user && user.is_password?(pword) ? user : nil
    end
    def password=(pword)
        @password = pword
        self.password_digest = BCrypt::Password.create(pword)
    end
    def is_password?(pword)
        BCrypt::Password.new(self.password_digest).is_password?(pword)
    end
    def reset_session_token!
        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end
    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

end

if __FILE__ == $PROGRAM_NAME
    User.all # shows no users
    empty_gage = User.new
    empty_gage.save # rollback because of failed validations
    password_too_short_gage = User.new(username: 'gage', password: 'test')
    password_too_short_gage.save # rollback because of failed validations
    gage = User.new(username: 'gage', password: 'testing')
    gage.save # inserted into Users
    User.all #<ActiveRecord::Relation [#<User id: 1, username: "gage"...
    User.first.password_digest # shows a string of gibberish that you can't hack

end