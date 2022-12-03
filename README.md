# README

## usersテーブル


｜Colum              | Type   | Options                   |
｜-------------------|--------|---------------------------|
｜email              | string | null: false, unique: true |
｜encrypted_password | string | null: false               |
｜nickname           | text   | null: false               |
｜first_name         | text   | null: false               |
｜last_name          | text   | null: false               |
｜birthday           | text   | null: false               |

has_many :items
has_many :users_items


## itemsテーブル

｜Colum              | Type       | Options                        |
｜-------------------|------------|--------------------------------|
｜item               | string     | null: false                    |
｜image              | string     | null: false                    |
｜category           | text       | null: false                    |
｜detail             | text       | null: false                    |
｜delivery_charge    | text       | null: false                    |
｜area               | text       | null: false                    |
｜number_days        | text       | null: false                    |
｜price              | text       | null: false                    |
｜explanation        | string     | null: false                    |
｜nickname           | references | null: false, foreign_key: true |

belongs_to :user
has_one :users_item


## users_itemsテーブル

｜Colum              | Type       | Options                        |
｜-------------------|------------|--------------------------------|
｜nickname           | references | null: false, foreign_key: true | 
｜item               | references | null: false                    |

belongs_to :user
belongs_to :item
has_one :users_address


## users_addressテーブル

｜Colum              | Type       | Options                        |
｜-------------------|------------|--------------------------------|
｜post_code          | string     | null: false                    |
｜prefectures        | string     | null: false                    |
｜city               | text       | null: false                    |
｜address            | text       | null: false                    |
｜tel                | text       | null: false                    |
｜building           | text       |                                |
｜nickname           | references | null: false, foreign_key: true |

belongs_to users_items









