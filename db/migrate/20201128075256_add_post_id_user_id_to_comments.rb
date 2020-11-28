class AddPostIdUserIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :post_id, :user_id
  end
end
