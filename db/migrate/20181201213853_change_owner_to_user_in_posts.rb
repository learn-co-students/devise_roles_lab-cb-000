class ChangeOwnerToUserInPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :owner_id, :user_id
  end
end
