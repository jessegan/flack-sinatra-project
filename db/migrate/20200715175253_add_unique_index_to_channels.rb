class AddUniqueIndexToChannels < ActiveRecord::Migration[4.2]
  def change
    add_index :channels, [:name,:group_id], unique: true
  end
end
