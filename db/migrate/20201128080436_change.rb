class Change < ActiveRecord::Migration[6.0]
  def change
    change_column :comments, :post_id, :integer
    add_column :comments, :user_id, :integer
  end
end
