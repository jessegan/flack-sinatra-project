class Group < ActiveRecord::Base
    validates_presence_of :name,:display_name,:public?
    validates_uniqueness_of :name
end