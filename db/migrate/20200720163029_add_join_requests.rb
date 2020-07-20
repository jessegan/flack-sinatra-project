class AddJoinRequests < ActiveRecord::Migration[6.0]
  def change
      create_table :join_requests do |t|
        t.integer :user_id, null: false
        t.integer :group_id, null: false
        t.boolean :accepted, null: false, default: false
        t.timestamps
      end
  end
end
