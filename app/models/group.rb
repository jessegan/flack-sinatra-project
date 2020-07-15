class Group < ActiveRecord::Base
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods

    has_many :group_users
    has_many :users, through: :group_users
    has_many :channels

    validates_presence_of :name,:display_name
    validates_uniqueness_of :name
end