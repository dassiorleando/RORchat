class AddUserIdToBookmark < ActiveRecord::Migration[5.0]
  def change
    add_column :bookmarks, :user_id, :integer
  end
end
