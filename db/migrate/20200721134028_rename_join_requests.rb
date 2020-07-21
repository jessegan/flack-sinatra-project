class RenameJoinRequests < ActiveRecord::Migration[6.0]
  def change
    rename_table :join_requests, :requests
  end
end
