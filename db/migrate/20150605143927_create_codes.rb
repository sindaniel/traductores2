class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :code, :unique
      t.integer :minutes

      #esto crea esos dos camposAF
      t.timestamps
    end
  end
end
