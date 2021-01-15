# README

## usersテーブル

| Colum             | Type       | Options     |
| ----------------- | ---------- | ----------- |
| email             | string     | unique: true|
| encrypted_password| string     | null: false |
| nickname          | string     | null: false |
| fname             | string     | null: false |
| lname             | string     | null: false |
| fkata             | string     | null: false |
| lkata             | string     | null: false |
| birth             | date       | null: false |

### Association
- has_many: comments
- has_many: products


## productテーブル

| Colum         | Type       | Options           |
| ------------- | ---------- | ----------------- |
| product       | string     | null: false       |
| price         | integer    | null: false       |
| user          | references | foreign_key: true |
| category_id   | integer    | null: false       |
| state_id      | integer    | null: false       |
| shipping_id   | integer    | null: false       |
| prefecture_id | integer    | null: false       |
| wait-day_id   | integer    | null: false       |
| buydate       | references | foreign_key: true |

### Association
- has_many: comments
- belong_to: user
- has_one: buydate


## commentsテーブル

| Colum      | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |             |
| product    | references |             |

### Association
- belong_to: user
- belong_to: product


<!-- 商品購入管理に関するテーブル -->
## buydateテーブル

| Colum      | Type       | Options           |
| ---------- | ---------- | ----------------- |
| nickname   | references | foreign_key: true |
| product    | references | foreign_key: true |

### Association
- has_one: product
- has_one: user


<!-- 配送先住所に関するテーブル -->
## addressテーブル

| Colum      | Type       | Options     |
| ---------- | ---------- | ----------- |
| postalcode | integer    | null: false |
| addone     | string     | null: false |
| addtwo     | string     | null: false |
| addthree   | string     | null: false |
| building   | string     | null: false |
| tell       | integer    | null: false |

### Association
- has_one: user
- has_one: product