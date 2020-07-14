class Group < ActiveRecord::Base
    has_many :groups_users
    has_many :users, through: :groups_users

    validates_presence_of :name,:display_name,:public?
    validates_uniqueness_of :name
end