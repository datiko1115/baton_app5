# テーブル設計

## usersテーブル
| Column             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_kana         | string | null: false               |
| last_kana          | string | null: false               |
| nickname           | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル
| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| item_name    | string      | null: false                    |
| description  | text        | null: false                    |
| category_id  | integer     | null: false                    |
| price        | integer     | null: false                    |
| condition_id | integer     | null: false                    |
| recipient_id | integer     | null: false                    |
| area_id      | integer     | null: false                    |
| shipment_id  | integer     | null: false                    |
| user_id      | references  | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :purchases

## ordersテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :addresses

## addressesテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postcode       | string     | null: false                    |
| prefectures_id | string     | null: false                    |
| address        | text       | null: false                    |
| building       | text       | null: false                    |
| phone          | string     | null: false                    |
| purchases_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchases