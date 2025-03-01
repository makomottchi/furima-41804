## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :products, dependent: :destroy


## destination テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| product_id         | integer    | null: false, foreign_key: true |
| post_code          | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| address            | string | null: false |
| building_name      | string | 
| phone_number       | string | null: false |
### Association

- belongs_to :product

## card テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| product_id            | integer    | null: false, foreign_key: true |
| customer_id        | string | null: false |
| card_id            | string | null: false |

### Association

- belongs_to :product
     
## category テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string | null: false |


### Association

- has_many :products

## product テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user_id            | integer    | null: false, foreign_key: true |
| name               | string | null: false |
| price              | string | null: false |
| description        | string | null: false |
| status             | string | null: false |
| size               | string | null: false |
| shipping_cost      | string | null: false |
| shipping_days      | string | null: false |
| prefecture_id      | string | null: false |
| judgment           | string |  
| category_id        | integer | null: false, foreign_key: true |


### Association

- belongs_to :user 
- belongs_to :category 
- has_many :images, dependent: :destroy
- belongs_to_active_hash :prefecture
- has_one :destination
- has_one :card

## image テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| product_id         | integer    | null: false, foreign_key: true |
| image              | string | null: false |

### Association
- belongs_to :product 



