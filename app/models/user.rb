class User < ActiveRecord::Base
    has_secure_password

    has_many :members
    has_many :groups, through: :members

    validates_presence_of :email, :password, :name
    validates_uniqueness_of :email
end