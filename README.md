# README

## usersテーブル(ユーザー情報)
| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name          | string     | null: false                    |
| nickname            | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| birth_date          | date       | null: false                    |


## itemsテーブル(商品情報)
| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| price               | integer    | null: false                    |
| shipping_cost_id    | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| shipping_days_id    | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

## purchases テーブル(購入記録)
| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| item                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |

##  shippingAddresses テーブル (発送先情報)
| Column              | Type       | Options                        |
| ------              | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| city                | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| purchase            | references | null: false, foreign_key: true |

## Models and Associations

### users
- `has_many :items`
- `has_many :purchases`
### items
- `belongs_to :user`
- `has_one :purchase`
### purchases
- `belongs_to :user`
- `belongs_to :item`
- `has_one :shipping_address`
### shippingAddresses
- `belongs_to :purchases`