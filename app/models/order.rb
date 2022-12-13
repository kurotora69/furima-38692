class Order
  include ActiveModel::Model
  attr_accessor :users_item, :delivery_charge_id, :price, :post_code, :prefecture_id, :city, :address, :building, :create_table, :user, :item

  with_options presence: true do
    validates :user
    validates :item
    validates :post_code,     format: { with: /^[0-9]{3}-[0-9]{4}$/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :tel,           format: { with: /^0\d{9,10}$/ }
    validates :users_item
  end  
  validates :building

  # def save
  #   UsersAddress.create(users_address: )
  #   UsersItem.create()
  # end 
end  

