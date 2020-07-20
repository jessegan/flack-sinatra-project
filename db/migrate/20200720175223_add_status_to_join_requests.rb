class AddStatusToJoinRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :join_requests, :status, :string, default: 'pending'
  end
end
