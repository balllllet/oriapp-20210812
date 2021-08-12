# テーブル設計

## users テーブル
| Column              | Type   | Options      |
| ------------------  | ------ | -----------  |
| nickname            | string | null: false  |
| introduction        | text   | null: false |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false  |
| family_name         | string | null: false  |
| first_name          | string | null: false  |
| family_name_reading | string | null: false  |
| first_name_reading  | string | null: false  |
| birthday            | date   | null: false  |
### Association
- has_many :items
- has_many :orders
- has_many :messages
- has_many :messages_seconds


## items テーブル
| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| name                   | string     | null: false |
| description            | text       | null: false |
| category_id            | integer    | null: false |
| sales_status_id        | integer    | null: false |
| prefecture_id          | integer    | null: false |
| scheduled_delivery_id  | integer    | null: false |
| price                  | integer    | null: false |
| user                   | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_one :order
- has_many :messages
- has_many :messages_seconds

## orders テーブル
| Column       | Type       | Options                        |
| -----------  | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル
| Column         | Type     | Options     |
| -----------    | -------- | ----------- |
| tel            | string   | null: false |
| orders         |references| null: false, foreign_key: true |
### Association
- belongs_to :order

## messages テーブル
| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| text            | text       | null: false |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
### Association
- belongs_to :item
- belongs_to :user

## messages_seconds テーブル
| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| text            | text       | null: false |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
### Association
- belongs_to :item
- belongs_to :user


