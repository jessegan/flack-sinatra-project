class AddUniqueIndexToChannels < ActiveRecord::Migration
  def change
    add_index :channels, [:name,:group_id], unique: true
  end
end
