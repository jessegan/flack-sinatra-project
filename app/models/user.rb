class User < ActiveRecord::Base
    has_secure_password

    has_many :groups_users
    has_many :groups, through: :groups_users

    validates_presence_of :email, :password, :name
    validates_uniqueness_of :email
end