class RemoveAcceptedFromJoinRequests < ActiveRecord::Migration[6.0]
  def change
    remove_column :join_requests, :accepted
  end
end
