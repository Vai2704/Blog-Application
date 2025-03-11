class AddStatusToPost < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :status, :boolean, default: true
  end
end
