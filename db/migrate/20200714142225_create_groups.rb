class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :display_name
      t.boolean :public?, default: 0
      
      t.timestamps
    end
  end
end
