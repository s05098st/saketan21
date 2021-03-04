# README

## アプリ名
Saketan

## 概要
日本酒が好きな方々が登録して頂き、好きな日本酒の情報を投稿して
20歳以上の成人会員だけで情報交換をするアプリケーションです。名前の由来は「お酒で探索」を略して
「Saketan」としました。高齢者も使いやすい様に文字を大きめにして、シンプルな機能を心がけました。

## 制作背景（意図）
作成者自信がお酒が大変好きで、インターネットで色々なお酒を調べていたことがきっかけです。
しかし、インターネットで調べているとただの広告や日本酒と全く関係のない投稿が数多く出てきて、
日本酒に特化した情報交換サイトが欲しかったと考え、作成することにしました。
また、飲んだ方々による率直な感想を求めている方々が多いと考え、投稿者の名前はニックネームで
表示される様に工夫しました。しかし、ただの誹謗中傷を防ぐ為に、登録時には本名を登録して頂き、
トラブルの際には管理者が把握できる様に考えております。

## DEMO
## ＜トップページから会員登録画面へ遷移＞
https://gyazo.com/4d8186ab8da82f0f62abb59b54113329

## ＜会員登録完了＞
https://gyazo.com/42812337f2e83c3ffce8503f672d4632

## ＜情報を投稿する＞
https://gyazo.com/77be47b0e18e98080bde1033f244b134

## ＜投稿内容詳細画面＞
https://gyazo.com/18dccdfa89c5dcc626f930a5add2bcbd

## ＜投稿を削除する＞
https://gyazo.com/1d2949aa210e71191b7099f7c2a57b0c

## ＜投稿にコメントする＞
https://gyazo.com/939e1b63813e9cdfcd0f7f8194e45b46

## ＜投稿を検索する＞
https://gyazo.com/f825ed7646f93ff45636e1a2d840a5c8

## ＜ログアウト＞
https://gyazo.com/84c26bbbb1625e8a7be9c4b159ea84c2

## 今後実装予定の機能
投稿に対して、「いいね」評価ができる機能を付けたいと考えております。
多くの会員が情報を投稿したり、コメントするだけではなく、
「いいね」機能で分かりやすく評価ができる様にしたいと考えております。


## usersテーブル

|Column            |Type   |Options                |
|------------------|-------|-----------------------|
|nickname          |string |null: false            |
|email             |string |null:false,unique: true|
|encrypted_password|string |null: false            |
|family_name       |string |null: false            |
|first_name        |string |null: false            |
|family_name_kana  |string |null: false            |
|first_name_kana   |string |null: false            |
|birth_day         |date   |null: false            |

## Association

has_many:items
has_many:comments


## itemsテーブル

|Column       |Type      |Options                      |
|-------------|----------|-----------------------------|
|company_name |string    |null: false                  |
|name         |string    |null: false                  |
|nomikuchi    |string    |null: false                  |
|nomikata     |string    |null: false                  |
|description  |text      |null: false                  |
|user         |references|null: false                  |


has_many:comments
belongs_to :user


## commentsテーブル

|Column            |Type       |Options                |
|------------------|-----------|-----------------------|
|text              |text       |null: false            |
|user              |references |null: false            |
|item              |references |null: false            |

## Association

belongs_to :item
belongs_to :user
