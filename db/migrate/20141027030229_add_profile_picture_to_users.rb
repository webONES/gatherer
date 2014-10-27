class AddProfilePictureToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_picture, :string
    add_column :users, :username, :string
  end
end
