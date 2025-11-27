class AddLatlngToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :latlng, :string
  end
end
