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
- has_many :orders, dependent: :destroy


## destinations テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| post_code          | string     | null: false |
| prefecture_id      | integer    | null: false |
| city               | string     | null: false |
| address            | string     | null: false |
| building_name      | string     | 
| phone_number       | string     | null: false |
| order              | references | null: false, foreign_key: true |
### Association

- belongs_to :order


     

## products テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null: false, foreign_key: true |
| name               | string | null: false |
| price              | integer| null: false |
| description        | text   | null: false |
| status_id          | integer| null: false |
| category_id        | integer| null: false |
| shipping_cost_id   | integer| null: false |
| shipping_day_id    | integer| null: false |
| prefecture_id      | integer| null: false |

### Association

- belongs_to :user 
- has_one :order

## orders テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| product            | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |



### Association

- belongs_to :product
- belongs_to :user
- has_to :destination










