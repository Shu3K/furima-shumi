# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
  has_many : items
  has_many : orders

## items テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| name          | string     | null: false                    |
| price         | string     | null: false                    |
| explain       | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| payment_id    | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association
  belongs_to : user
  has_many : orders

## orders テーブル

| Column | Type       | Options                        |
| -------| ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
  belongs_to : user
  belongs_to : items

## address テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | text       | null: false                    |
| building      | string     | null: true                     |
| phone         | string     | null: false                    |

### Association
  belongs_to : orders