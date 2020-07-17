class AddAdminToGroupUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :group_users,:admin,:boolean,default:0
  end
end
