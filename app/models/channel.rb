class Channel < ActiveRecord::Base
    belongs_to :group

    before_validation :lowercase_name_before_validation

    validates :name, uniqueness: {scope: :group_id}

    private 
        def lowercase_name_before_validation
            self.name.downcase!
        end
end