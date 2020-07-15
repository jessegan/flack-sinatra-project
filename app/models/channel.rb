class Channel < ActiveRecord::Base
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods

    belongs_to :group
    has_many :messages

    before_validation :lowercase_name_before_validation

    validates :name, uniqueness: {scope: :group_id}

    private 
        def lowercase_name_before_validation
            self.name.downcase!
        end
end