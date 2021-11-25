class AddUserIdToCollege < ActiveRecord::Migration[6.1]
  def change
    add_reference :colleges, :user, null: false, foreign_key: true
  end
end
