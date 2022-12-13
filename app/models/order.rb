class Orders
  include ActiveModel::Model
  attr_accessor :users_item, :delivery_charge_id, :price, :post_code, :prefecture_id, :city, :address, :building, :tel