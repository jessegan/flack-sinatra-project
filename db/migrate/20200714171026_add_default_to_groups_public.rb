class AddDefaultToGroupsPublic < ActiveRecord::Migration
  def change
    change_column_default(:groups,:public?, from: nil,to: false)
  end
end
