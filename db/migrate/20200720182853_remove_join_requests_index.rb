class RemoveJoinRequestsIndex < ActiveRecord::Migration[6.0]
  def change
    remove_index :join_requests, column: [:user_id,:group_id]
  end
end
