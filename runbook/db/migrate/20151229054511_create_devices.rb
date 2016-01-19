class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.text :ts_steps
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
