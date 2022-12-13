class Order
  include ActiveModel::Model
  attr_accessor :users_item, :delivery_charge_id, :price, :post_code, :prefecture_id, :city, :address, :building, :create_table, :user, :item

  with_options presence: true do
    validates :user
    validates :item
    validates :post_code
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :tel
    validates :building
    validates :users_item
  end  

  def save
    UsersAddress.create()
    UsersItem.create()
  end 
end  

