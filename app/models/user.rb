class User < ActiveRecord::Base
    has_secure_password

    has_many :group_users
    has_many :groups, through: :group_users
    has_many :messages
    has_many :requests

    before_validation :lowercase_email_before_validation

    validates_presence_of :email, :password, :name
    validates_uniqueness_of :email

    def group_invites
        self.requests.where(status:'pending',request_type:'invite')
    end

    def group_requests
        self.requests.where(status:'pending',request_type:'join')
    end

    private
        def lowercase_email_before_validation
            self.email.downcase!
        end
end