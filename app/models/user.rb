class User < ActiveRecord::Base
    has_secure_password

    has_many :group_users
    has_many :groups, through: :group_users
    has_many :messages
    has_many :requests

    before_validation :lowercase_email_before_validation

    validates_presence_of :email, :password, :name
    validates_uniqueness_of :email

    private
        def lowercase_email_before_validation
            self.email.downcase!
        end
end