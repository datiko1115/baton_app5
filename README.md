# アプリケーション名
Baton

# アプリケーション概要
廃棄前の洋服を販売することで、廃棄となる洋服を減らす事ができ、副業もできるアプリ

# URL
https://baton-app5-37562.herokuapp.com/

# テスト用アカウント
### 管理者ユーザー
email : aaaa@aaaa
pass : aaa111

### バイヤーユーザー
email : bbbb@bbbb
pass : bbb111

### カスタマーユーザー
email : cccc@cccc
pass : ccc111

# 利用方法
## 概要
管理者が買い付け用の商品を販売し、バイヤーユーザーがそれを買い付け、商品を出品、カスタマーユーザーがその商品を買うことができる。<br>
<br>

### -管理者ユーザー
管理者ユーザーは、商品を販売時、販売したアイテムが売れた時にマージンを受け取れる。<br>
<br>

### -バイヤーユーザー
バイヤーユーザーは買い付けた商品が売れた際、売れた金額から手数料と購入した金額を引いた額が受け取れる。<br>
<br>

### -カスタマーユーザー
バイヤーユーザーが出品した商品を購入することができる。<br>
<br>

# アプリケーションを作成した背景
前職で、アパレル企業で働いていた事からアパレル業界の知識を知る機会が多く、世の中で流通している洋服のうち50%の洋服が廃棄されているという現状を知りました。<br>
そして、そんな廃棄される洋服を買い付けて、実店舗にて販売をしているベンチャー企業があるという事を知り、もし自身がそのベンチャー企業の経営者であるならば、どのようにすれば廃棄になる洋服を減らせるかどうか考え、
かつこの不況の中、ITの力で人助けもできればいいと思いこのアプリを作りました。<br>
### -フリマアプリを展開したいベンチャー企業経営者

・性別 ： 男性<br>
・年齢 ： ３0代<br> 
・仕事 ： 廃棄前の洋服を売るベンチャー企業<br>
・趣味 ： ゲーム、ファッション、ネット通販、<br>
<br>
### -悩み<br>
・店舗型でテナント代での月々のコストがかかる<br>
・店舗型による人件費のコスト<br>
・一度に大量の廃棄前の洋服を仕入れるため、それを保管する在庫スペースが圧迫してそれが大きなコストになっている<br>
<br>
### -解決するには<br>
・WEBアプリにて販売することによって人件費、およびテナント代のコストをカットできる<br>
・個人に販売を委託することにより、在庫スペースのコストをカットすることができる<br>
（販売委託を任せるユーザーはウーバーイーツのような形式で副業のような形式で集める、ターゲットは主に隙間時間に副業を考えている主婦層、ファッションが好きなファッションインスタグラマー等）<br>
<br>
WEBで商品を販売するためには？ ： メルカリやラクマのように気軽に使える商品出品、購入機能<br>
・フリマアプリ等々の差別化を図るためには？ ： バーチャル試着機能<br>
・販売促進を図るためには？ ： コメント機能<br>
・より便利にするには？ ： フォロー管理機能、お気に入り管理機能<br>
・ユーザーを増やすには？ ： SNSログイン機能、SNS共有機能<br>

という設定でアプリを構想しました。<br>
<br>
# 洗い出した要件
https://docs.google.com/spreadsheets/d/1g1XmWcnw1I4A6_34Eo6WzUSxUGyZ2yH3wkerSS5D0rg/edit#gid=982722306<br>
<br>

# 実装した機能についての画像やGIFおよびその説明
## -管理者ユーザー<br>
[![Image from Gyazo](https://i.gyazo.com/757c677786f0f587c1aeae3d5cca1bfa.gif)](https://gyazo.com/757c677786f0f587c1aeae3d5cca1bfa)
トップページのフッターからログイン、新規登録が可能です<br>
<br>

[![Image from Gyazo](https://i.gyazo.com/dabfc239455925a83cb8014226bbefcc.gif)](https://gyazo.com/dabfc239455925a83cb8014226bbefcc)
ログイン後、ログインボタンがユーザー名に変わり、ユーザー名を押すとマイページに移動ができます。<br>
右下にあるカメラアイコンを押すことにより、仕入れ用品の出品ページに移動できます。<br>
<br>

## -バイヤーユーザー
[![Image from Gyazo](https://i.gyazo.com/0849c24b6501301829609a3a70446c97.gif)](https://gyazo.com/0849c24b6501301829609a3a70446c97)
トップページのヘッダーからログイン、新規登録（登録画面にてバイヤーユーザー若しくはカスタマーユーザーを選択します。）が可能です<br>
<br>

[![Image from Gyazo](https://i.gyazo.com/3796ab67e204f441dfa1c058cdd3d71a.gif)](https://gyazo.com/3796ab67e204f441dfa1c058cdd3d71a)
バイヤーユーザーの場合は、通常の出品一覧の下に『買付可能品一覧』が出ますのでその中から買い付けたい商品を購入できます。<br>
<br>

[![Image from Gyazo](https://i.gyazo.com/5b658a3cd86b7a3e84b2d2cd0ab5ea07.gif)](https://gyazo.com/5b658a3cd86b7a3e84b2d2cd0ab5ea07)
ユーザーページ、もしくはトップページ右下のカメラアイコンを押すことにより出品ができます。<br>
<br>

## -カスタマーユーザー
カスタマーユーザーも同じくトップページ上部からログイン、新規登録することが出来ます。（登録画面にてバイヤーユーザー若しくはカスタマーユーザーを選択します。）<br>
<br>
[![Image from Gyazo](https://i.gyazo.com/38f2fb94b78484ebca4bfd372296257d.gif)](https://gyazo.com/38f2fb94b78484ebca4bfd372296257d)
ピックアップカテゴリーから商品詳細ページに進む事が出来、購入ページに遷移する事が出来ます。<br>
<br>

## -バーチャル試着機能
[![Image from Gyazo](https://i.gyazo.com/cf104daa7ffd2843006c2c9c6e203fa4.gif)](https://gyazo.com/cf104daa7ffd2843006c2c9c6e203fa4)
ユーザー登録時、バーチャル試着用の画像を任意で登録できます。（後からでも追加可能）<br>
<br>
[![Image from Gyazo](https://i.gyazo.com/22c9dc01a10a95753aa5f669ef690d2b.gif)](https://gyazo.com/22c9dc01a10a95753aa5f669ef690d2b)
管理者ユーザー出品時バーチャル試着用の画像を登録します。<br>
<br>
[![Image from Gyazo](https://i.gyazo.com/2fc92b8571435441073abcceb40cb0f6.gif)](https://gyazo.com/2fc92b8571435441073abcceb40cb0f6)
商品購入ボタンの下にバーチャル試着を試すボタンを押すことで擬似的な試着をする事が可能です。（現在カスタマーユーザーのみ使用可能）<br>
<br>
[![Image from Gyazo](https://i.gyazo.com/bbe1444d5b814d8e1ce33dc12027e455.jpg)](https://gyazo.com/bbe1444d5b814d8e1ce33dc12027e455)
[![Image from Gyazo](https://i.gyazo.com/037c85ac12ad21c65a3b76d6a238588c.jpg)](https://gyazo.com/037c85ac12ad21c65a3b76d6a238588c)
<br>
<br>

# 実装予定の機能
## -基本機能<br>
コメント機能、フォロー機能、お気に入り機能等を実装予定<br>
<br>
## -特別機能<br>
バーチャル試着機能に使用するための携帯写真アプリを作成予定<br>
<br>
# データベース設計
[![Image from Gyazo](https://i.gyazo.com/a4cda37a02f46254f1d4cac0a244fb56.png)](https://gyazo.com/a4cda37a02f46254f1d4cac0a244fb56)

　
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/7941e096bc7364f33e0ec15fa3667c1b.png)](https://gyazo.com/7941e096bc7364f33e0ec15fa3667c1b)

# 開発環境
-フロントエンド
-バックエンド
-インフラ
-テスト
-テキストエディタ
-タスク管理

# ローカルでの動作方法
git clone https://github.com/datiko1115/baton_app5.git

cd baton_app5

bundle install

yarn install<br>
<br>

# 工夫したポイント
バーチャル試着機能をとにかく先に仕上げる事に執着しました。<br>

理由は2つあります。<br>

理由2<br>
カリキュラム内でほぼ答えがあるものを作るより自分自身で考えた機能を作り上げる方が自身のプログラマーとしての素養を育成できると思った事です。<br>
<br>
理由2<br>
全く新しい知識で自分自身が考えた機能を作るにあたって期限までにアプリを形にできるかどうか判断が難しかったからです。<br>
構造自体は通常学習中に事前に少しづつ情報を集めながら可能か、不可能か、どのような技術を使えば実現可能かを調べていましたが、学習カリキュラムに全くない機能であった事と、メンターに頼ることが出来ない事を踏まえた上先に、ある程度先に形にしておく事が必要だと考えた為です。

上記2点を踏まえた上でアプリ制作を行なった結果、自分で新しい知識を１から調べ、形にすることにより、これまでより自身でわからない問題をいかにして解決するかを学ぶことが出来ました。<br>
<br>

# テーブル設計

## adminテーブル
| Column             | Type        | Options                        |
| ------------------ | ----------- | ------------------------------ |
| email              | string      | null: false, unique: true      |
| encrypted_password | text        | null: false                    |
| admin_name         | integer     | null: false                    |
### Association
has_many :admin_items


## usersテーブル
| Column               | Type   | Options                   | 
| -------------------- | ------ | ------------------------- |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| first_name           | string | null: false               |
| last_name            | string | null: false               |
| first_kana           | string | null: false               |
| last_kana            | string | null: false               |
| nickname             | string | null: false               |
| birthday             | date   | null: false               |
| buyer_or_customer_id | integer| null: false               |
### Association
- has_many :items
- has_many :orders
- has_many :buyer_orders
- has_many :virtual_fitting 
- has_many_attached :images


## admin_itemsテーブル
| Column                | Type        | Options                        |
| --------------------- | ----------- | ------------------------------ |
| admin_item_name       | string      | null: false                    |
| admin_description     | text        | null: false                    |
| category_id           | integer     | null: false                    |
| proper_price          | integer     | null: false                    |
| price                 | integer     | null: false                    |
| admin                 | references  | null: false, foreign_key: true |
### Association
- belongs_to :admin
- has_one :buyer_order
- has_one :item
- has_many_attached :vrf_images


## buyer_ordersテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| admin_item | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :admin_item
- has_one :buyer_address


## buyer_addressesテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postcode       | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone          | string     | null: false                    |
| buyer_order    | references | null: false, foreign_key: true |
### Association
- belongs_to :buyer_order


## itemsテーブル
| Column         | Type        | Options                        |
| -------------- | ----------- | ------------------------------ |
| item_name      | string      | null: false                    |
| description    | text        | null: false                    |
| category_id    | integer     | null: false                    |
| price          | integer     | null: false                    |
| recipient_id   | integer     | null: false                    |
| prefecture_id  | integer     | null: false                    |
| shipment_id    | integer     | null: false                    |
| user           | references  | null: false, foreign_key: true |
|admin_item     | references  | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_many_attached :images
- has_one :order


## ordersテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postcode       | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone          | string     | null: false                    |
| order          | references | null: false, foreign_key: true |
### Association
- belongs_to :order