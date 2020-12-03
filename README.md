# README

## users テーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- |
| nickname           | string    | null: false |
| email              | string    | null: false |
| encrypted_password | string    | null: false |
| first_name         | string    | null: false |
| last_name          | string    | null: false |
| first_kana         | string    | null: false |
| last_kana          | string    | null: false |
| birthday           | datetime  | null: false |

### Association

- has_many : items
- has_one :  buyer

## items テーブル

| Column            | Type      | Options     |
| ----------------  | --------- | ----------- |
| image             |           |             |
| item_name         | text      | null: false |
| item_explanation  | text      | null: false |
| item_category_id  | string    | null: false |
| item_status_id    | string    | null: false |
| delivery_fee_id   | string    | null: false |
| seller_address_id | string    | null: false |
| delivery_day_id   | string    | null: false |
| price             | integer   | null: false |
| user              | reference | null: false |

### Association

- belongs_to : user

## buyers テーブル

| Column           | Type      | Options     |
| ---------------- | --------- | ----------- |
| card_number      | integer   | null: false |
| expiration_date  | datetime  | null: false |
| security_code    | integer   | null: false |
| postal_code      | string    | null: false |
| todofuken_id     | string    | null: false |
| shityoson        | string    | null: false |
| address          | string    | null: false |
| building         | string    | null: false |
| telephone        | integer   | null: false |
| user             | reference | null: false |

### Association

- belongs_to : user
- has_many   : items
