class Channel < ActiveRecord::Base
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods

    belongs_to :group
    has_many :messages, dependent: :destroy

    before_validation :lowercase_name_before_validation

    validates :name, uniqueness: {scope: :group_id}

    def self.find_by_slug(group_slug, channel_slug)
        Group.find_by_slug(group_slug).channels.find {|c| c.slug==channel_slug}
    end

    private 
        def lowercase_name_before_validation
            self.name.downcase!
        end
end