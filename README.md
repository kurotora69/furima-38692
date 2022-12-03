# README

## usersテーブル

 | Colum               | Type     | Options                   |
 | ------------------- | -------- | ------------------------- |
 | email               | string   | null: false, unique: true |
 | encrypted_password  | string   | null: false               |
 | nickname            | string   | null: false               |
 | first_name          | string   | null: false               |
 | last_name           | string   | null: false               |
 | first_name_read     | string   | null: false               |
 | last_name_read      | string   | null: false               |
 | birthday            | date     | null: false               |

 - has_many :items
 - has_many :users_items


## itemsテーブル

 | Colum               | Type         | Options                        |
 | ------------------- | ------------ | ------------------------------ |
 | item_name           | string       | null: false                    |
 | category_id         | integer      | null: false                    |
 | detail_id           | integer      | null: false                    |
 | delivery_charge_id  | integer      | null: false                    |
 | number_day_id       | integer      | null: false                    |
 | price               | integer      | null: false                    |
 | explanation         | text         | null: false                    |
 | user                | references   | null: false, foreign_key: true |

 - belongs_to :user
 - has_one :users_item


## users_itemsテーブル

 | Colum              | Type       | Options                        |
 | ------------------ | ---------- | ------------------------------ |
 | user               | references | null: false, foreign_key: true | 
 | item               | references | null: false, foreign_key: true |
 
 - belongs_to :user
 - belongs_to :item
 - has_one :users_address


## users_addressesテーブル

 | Colum              | Type       | Options                        |
 | ------------------ | ---------- | ------------------------------ |
 | post_code          | string     | null: false                    |
 | prefecture_id      | integer    | null: false                    |
 | city               | string     | null: false                    |
 | address            | string     | null: false                    |
 | tel                | string     | null: false                    |
 | building           | string     |                                |
 | users_item         | references | null: false, foreign_key: true |

 - belongs_to :users_item









