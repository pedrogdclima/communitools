class CreateTool < ActiveRecord::Migration[8.0]
  def change
    create_table :tools do |t|
      t.string :name
      t.text :description
      t.references :users

      t.timestamps
    end
  end
end
