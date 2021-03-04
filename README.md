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
