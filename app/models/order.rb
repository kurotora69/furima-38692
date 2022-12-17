class Order
  include ActiveModel::Model
  attr_accessor  :users_item_id, :post_code, :prefecture_id, :city, :address, :building, :tel, :user_id, :item_id, :token
  # :price, 
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,     format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :tel,           format: { with: /\A\d{10,11}\z/ }
    validates :token
  end  
  # validate :building validates :users_item

  def save
    users_item = UsersItem.create(user_id: user_id, item_id: item_id)
    UsersAddress.create(users_item_id: users_item_id,  post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, tel: tel, users_item_id: users_item.id)
    # price: price,
  
  end 
end  



