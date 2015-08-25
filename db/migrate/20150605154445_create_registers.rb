class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.integer :time
      t.belongs_to :code

      t.timestamps
    end
  end
end
