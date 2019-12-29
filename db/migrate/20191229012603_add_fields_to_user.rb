class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :fullname, :string
    add_column :users, :contact, :string
  end
end
