class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :users_item


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :detail
  belongs_to :delivery_charge
  belongs_to :number_day
  belongs_to :prefecture

  validates :item_name,          presence: true
  validates :category_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :detail_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :number_day_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :price,              presence: true,
                                 numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :prefecture_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :explanation,        presence: true
  validates :image,              presence: true
  
end
