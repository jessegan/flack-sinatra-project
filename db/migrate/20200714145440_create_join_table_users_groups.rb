class CreateJoinTableUsersGroups < ActiveRecord::Migration
  def change
    create_join_table :users,:groups, table_name: :members
  end
end
