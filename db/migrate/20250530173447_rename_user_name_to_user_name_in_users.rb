class RenameUserNameToUserNameInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :userName, :user_name
  end
end
