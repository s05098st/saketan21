# README

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