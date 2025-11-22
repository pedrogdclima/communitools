class AddUserToTools < ActiveRecord::Migration[8.0]
  def change
    add_reference :tools, :user, null: false, foreign_key: true
  end
end
