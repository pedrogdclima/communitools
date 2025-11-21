class CreateTools < ActiveRecord::Migration[8.0]
  def change
    create_table :tools do |t|
      t.string :name
      t.text :brand
      t.text :desc

      t.timestamps
    end
  end
end
