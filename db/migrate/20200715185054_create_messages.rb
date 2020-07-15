class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :channel_id, null:false
      t.integer :user_id, null:false
      t.text :contents, null:false

      t.timestamps
    end
  end
end
