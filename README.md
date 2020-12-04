# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_kana         | string | null: false |
| last_kana          | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many : items
- has_many : purchases


## items テーブル

| Column            | Type      | Options     |
| ----------------  | --------- | ----------- |
| item_name         | string    | null: false |
| item_explanation  | text      | null: false |
| item_category_id  | integer   | null: false |
| item_status_id    | integer   | null: false |
| delivery_fee_id   | integer   | null: false |
| prefecture_id     | integer   | null: false |
| delivery_day_id   | integer   | null: false |
| price             | integer   | null: false |
| user              | reference | null: false |

### Association

- belongs_to : user
- has_one : purchase


## purchases テーブル

| Column     | Type      | Options     |
| ---------- | --------- | ----------- |
| user_id    | string    | null: false |
| item_id    | integer   | null: false |
| user       | reference | null: false |
| item       | reference | null: false |

### Association

- belongs_to : user
- has_one : item
- has_one : address


## address テーブル

| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
| postal_code    | string    | null: false |
| prefecture_id  | integer   | null: false |
| municipalities | string    | null: false |
| address        | string    | null: false |
| building       | string    |             |
| telephone      | string    | null: false |
| purchase       | reference | null: false |

### Association

- belongs_to : user
- has_one : purchase
