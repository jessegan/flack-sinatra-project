class Group < ActiveRecord::Base
    has_many :members
    has_many :users, through: :members

    validates_presence_of :name,:display_nameMem
    validates_uniqueness_of :name
end