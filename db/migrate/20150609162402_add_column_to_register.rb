class AddColumnToRegister < ActiveRecord::Migration
  def change

    add_column :registers, :idioma, :integer
  end
end
