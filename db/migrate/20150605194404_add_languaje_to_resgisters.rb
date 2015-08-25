class AddLanguajeToResgisters < ActiveRecord::Migration
  def change
    add_column :registers, :lang, :integer
  end
end
