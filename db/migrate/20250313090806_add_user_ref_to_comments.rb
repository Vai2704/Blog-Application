class AddUserRefToComments < ActiveRecord::Migration[8.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: true, null: true
  end
end
