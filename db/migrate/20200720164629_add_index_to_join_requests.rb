class AddIndexToJoinRequests < ActiveRecord::Migration[6.0]
  def change
    add_index :join_requests, [:user_id,:group_id], unique: true
  end
end
