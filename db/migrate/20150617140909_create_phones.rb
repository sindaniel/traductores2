class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :name
      t.string :phone
      t.belongs_to :language

      t.timestamps
    end
  end
end
