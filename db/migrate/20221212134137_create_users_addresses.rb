class CreateUsersAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :users_addresses do |t|

      t.timestamps
    end
  end
end
