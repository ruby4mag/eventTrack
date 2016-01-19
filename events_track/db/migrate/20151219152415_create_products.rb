class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :categoty
      t.string :date
      t.string :Price

      t.timestamps null: false
    end
  end
end
