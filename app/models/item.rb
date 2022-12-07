class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :detail
  belongs_to :delivery_charge
  belongs_to :number_day
  belongs_to :prefecture

  validates :item_name,          presence: true
  validates :category_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :detail_id,          numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :number_day_id,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,              presence: true
  validates :prefecture_id,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :explanation,        presence: true
  validates :user,               presence: true

end
