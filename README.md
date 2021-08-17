# テーブル設計

## users テーブル
| Column              | Type   | Options      |
| ------------------  | ------ | -----------  |
| nickname            | string | null: false  |
| introduction        | text   | null: false  |
| email               | string | null: false, unique: true |
| tel                 | string | null: false, |
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




<アプリケーション名>
wheel-trade (ホイールトレード)

<アプリケーション概要>
車椅子専用のマッチング型フリーマーケットアプリです。使用しない車椅子を、貸出や売却、購入やレンタルが出来ます。アプリ上での金銭のやりとりは行わず、マッチングをして取引を行ってもらいます。クレジットカードや住所など個人情報の登録が不要でシンプルなシステムになっています。
[![Image from Gyazo](https://i.gyazo.com/38133297f981ac7d609f75cbe04f7b4d.gif)](https://gyazo.com/38133297f981ac7d609f75cbe04f7b4d)

URL:	https://oriapp-20210812.herokuapp.com/

テスト用アカウント1:	アドレス:a@a パスワード:aaaaa1

テスト用アカウント2:	アドレス:b@b パスワード:bbbbb1 


<目指した課題解決>
このようアプリを調べても見つからず、車椅子ユーザーが、気軽に簡単に車椅子を使用して欲しかったので作成しました。
車椅子メインユーザーの高齢者の層にも使用してもらいたかったので、かなりシンプルなシステムにしました。
他のフリマサイトで車椅子を出品することもできますが、配送するにはかなり重いためマッチング型で配送を不要とし、車椅子の専用アプリにすることで欲しいものが見つかりやすく、出品した物も見てもらいやすくなるという課題解決をしました。
今後は、タイムズカーシェアリングを参考にしてレンタルが安全に簡単に行えるように考えていきます。


<洗い出した要件>
																			
出品機能	取引したい商品を出品して他のユーザーに見てもらう
																				
コメント機能	ユーザー同士コメント欄でがやり取りできる

購入(貸出)機能	借りたい買いたい車椅子の購入の約束確定

ユーザーページ	ユーザー情報や取引の一覧が見れる

おすすめアプリ紹介	車椅子ユーザーへのおすすめアプリが見れて、URLから飛べる	

検索機能	欲しい商品の種類で検索して興味のある商品のみ一覧に表示させる

いいね機能		星マークを押していいねができ、星の数で商品の人気度を知れる

地図で検索できる機能	購入(貸出)希望者が地図上で検索ができる

DM機能	購入(貸出)候補者と出品者がダイレクトメッセージでやり取りができる



<実装した機能についての動画>	
出品機能
[![Image from Gyazo](https://i.gyazo.com/7ed1219e14a03bd5a6587fe94e44a5d7.gif)](https://gyazo.com/7ed1219e14a03bd5a6587fe94e44a5d7)

コメント機能:非同期通信でリロードなしでチャット可能です
[![Image from Gyazo](https://i.gyazo.com/0c02159e9e298362e2b8339f377e849f.gif)](https://gyazo.com/0c02159e9e298362e2b8339f377e849f)

検索機能
[![Image from Gyazo](https://i.gyazo.com/ae235f192e38d9f7644cbbd0f6fdc604.gif)](https://gyazo.com/ae235f192e38d9f7644cbbd0f6fdc604)

ユーザー詳細ページ
[![Image from Gyazo](https://i.gyazo.com/72b5477407d50ba0ee5b47311f0c3817.gif)](https://gyazo.com/72b5477407d50ba0ee5b47311f0c3817)

おすすめアプリ
[![Image from Gyazo](https://i.gyazo.com/6284d1ffce8ec0ab8e7dacbc300514e9.gif)](https://gyazo.com/6284d1ffce8ec0ab8e7dacbc300514e9)


<実装予定の機能>	
自分以外のユーザーページ
カテゴリーからの検索機能
いいね機能
地図で検索できる機能
DM機能
そのほか、既存のフリマアプリやカーシェアリングアプリを参考に追加していく予定です。

