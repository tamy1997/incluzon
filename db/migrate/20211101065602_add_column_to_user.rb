class AddColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :pincode, :integer
    add_column :users, :website, :string
    add_column :users, :authority_name, :string
    add_column :users, :number, :bigint
  end
end
