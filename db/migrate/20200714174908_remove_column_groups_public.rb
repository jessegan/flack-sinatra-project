class RemoveColumnGroupsPublic < ActiveRecord::Migration
  def up
    remove_column :groups,:public?
  end

  def down
    add_column :groups, :public?, :boolean
  end
end
