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


## destinations テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| product            | references | null: false, foreign_key: true |
| post_code          | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| address            | string | null: false |
| building_name      | string | 
| phone_number       | string | null: false |
### Association

- belongs_to :product


     

## products テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null: false, foreign_key: true |
| name               | string | null: false |
| price              | integer| null: false |
| description        | text   | null: false |
| status             | integer| null: false |
| category           | integer| null: false |
| shipping_cost      | integer| null: false |
| shipping_days      | integer| null: false |
| prefecture         | integer| null: false |

### Association

- belongs_to :user 
- has_one :destination
- has_one :order

## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| product            | references | null: false, foreign_key: true |


### Association

- belongs_to :product










