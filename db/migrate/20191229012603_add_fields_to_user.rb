class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :fullname, null: false
      t.string :username, null: false
      t.string :contact, null: false
      t.boolean :admin, default: false
      t.boolean :listener, default: false
    end
  end
end
