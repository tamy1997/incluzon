class AddMessageToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :message, :string
  end
end
