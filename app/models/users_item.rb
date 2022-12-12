class UsersItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :users_address
end
