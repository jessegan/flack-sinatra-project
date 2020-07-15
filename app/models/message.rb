class Message < ActiveRecord::Base
    belongs_to :channel
    belongs_to :user

    validates_presence_of :contents, :channel_id, :user_id
end