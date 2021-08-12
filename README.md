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

## items テーブル
| Column                 | Type       | Options     |
| ---------------------- | ---------- | ----------- |
| name                   | string     | null: false |
| description            | text       | null: false |
| add                    | string     | null: false |
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




アプリケーション名：	wheel-trade (ホイールトレード)

アプリケーション概要：	車椅子専用のマッチング型フリーマーケットアプリです。使用しない車椅子を、貸出や売却が出来ます。アプリ上での金銭のやりとりは行わず、マッチングをして取引を行ってもらいます。クレジットカードや住所など個人情報の登録は不要ですが、貸出時の返却のため、電話番号は登録していただきます。

URL:	https://oriapp-20210812.herokuapp.com/

テスト用アカウント1:	アドレス:a@a パスワード:aaaaa1 
テスト用アカウント2:	アドレス:b@b パスワード:bbbbb1 

目指した課題解決	

洗い出した要件	スプレッドシートにまとめた要件定義を記述。
実装した機能についての画像やGIFおよびその説明	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。

実装予定の機能	DM機能、マイページの編集や表示、いいね機能。そのほか、既存のフリマアプリやカーシェアリングアプリを参考に追加していく予定です。

データベース設計	

ローカルでの動作方法	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。この時、アプリケーション開発に使用した環境を併記することを忘れないこと（パッケージやRubyのバージョンなど）。