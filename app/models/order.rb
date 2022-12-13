class Order
  include ActiveModel::Model
  attr_accessor :users_item, :price, :post_code, :prefecture_id, :city, :address, :building, :tel, :user, :item

  with_options presence: true do
    validates :user
    validates :item
    validates :post_code,     format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :tel,           format: { with: /^0\d{9,10}$/ }
    validates :users_item
  end  
  validates :building

  def save
    UsersAddress.create(users_item_id: user_item_id, price: price, post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, tel: tel)
    UsersItem.create(user: user, item: item)
  end 
end  



