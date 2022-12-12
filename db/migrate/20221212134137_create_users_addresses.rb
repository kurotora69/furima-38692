class CreateUsersAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :users_addresses do |t|
      t.string     :post_code,     null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :address,       null: false
      t.string     :tel,           null: false
      t.string     :building
      t.references :users_item,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
