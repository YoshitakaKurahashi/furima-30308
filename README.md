# README

## users テーブル

| Column     | Type      | Options     |
| ---------- | --------- | ----------- |
| nickname   | string    | null: false |
| email      | string    | null: false |
| password   | string    | null: false |
| first_name | string    | null: false |
| last_name  | string    | null: false |
| first_kana | string    | null: false |
| last_kana  | string    | null: false |
| birthday   | integer   | null: false |

### Association

- has_many : items
- has_one :  buyer

## items テーブル

| Column           | Type      | Options     |
| ---------------- | --------- | ----------- |
| image            |           |             |
| item_name        | text      | null: false |
| item_explanation | text      | null: false |
| item_category    | string    | null: false |
| item_status      | string    | null: false |
| delivery_fee     | string    | null: false |
| seller_address   | string    | null: false |
| delivery_day     | string    | null: false |
| price            | integer   | null: false |
| user             | reference | null: false |
| buyer            | reference | null: false |

### Association

- belongs_to : user
- belongs_to : buyer

## buyers テーブル

| Column           | Type      | Options     |
| ---------------- | --------- | ----------- |
| card_number      | integer   | null: false |
| expiration_date  | datetime  | null: false |
| security_code    | integer   | null: false |
| postal_code      | string    | null: false |
| prefectures      | string    | null: false |
| municipalities   | string    | null: false |
| address          | string    | null: false |
| building         | string    | null: false |
| telephone        | integer   | null: false |
| user             | reference | null: false |

### Association

- belongs_to : user
- has_many   : items
