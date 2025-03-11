class AddStatusToComments < ActiveRecord::Migration[8.0]
  def change
    add_column :comments, :status, :boolean, default: true
  end
end
