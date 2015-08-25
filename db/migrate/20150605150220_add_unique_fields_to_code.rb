class AddUniqueFieldsToCode < ActiveRecord::Migration
  def change

    add_index :codes, :code, :unique => true
    remove_column :codes, :unique
  end
end
