class AddColumnsIndicesToMembers < ActiveRecord::Migration
  def change
    add_column :members, :group_id, :integer
    add_column :members, :user_id, :integer
  end
end
