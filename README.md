# README

## usersテーブル

| Colum             | Type       | Options                  |
| ----------------- | ---------- | ------------------------ |
| email             | string     | unique: true, null: false|
| encrypted_password| string     | null: false              |
| nickname          | string     | null: false              |
| fname             | string     | null: false              |
| lname             | string     | null: false              |
| fkata             | string     | null: false              |
| lkata             | string     | null: false              |
| birth             | date       | null: false              |

### Association
- has_many: comments
- has_many: products
- has_many: buydates


## productテーブル

| Colum         | Type       | Options           |
| ------------- | ---------- | ----------------- |
| product       | string     | null: false       | 
| explain       | text       | null: false       | 
| price         | integer    | null: false       |
| user          | references | foreign_key: true |
| category_id   | integer    | null: false       |
| state_id      | integer    | null: false       |
| shipping_id   | integer    | null: false       |
| prefecture_id | integer    | null: false       |
| waitday_id    | integer    | null: false       |

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
## buydataテーブル

| Colum      | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| product    | references | foreign_key: true |

### Association
- belongs_to: product
- belongs_to: user
- has_one: address


<!-- 配送先住所に関するテーブル -->
## addressテーブル

| Colum         | Type       | Options           |
| ------------- | ---------- | ----------------- |
| postalcode    | string     | null: false       |
| prefecture_id | integer    | null: false       |
| addtwo        | string     | null: false       |
| addthree      | string     | null: false       |
| building      | string     |                   |
| tel           | string     | null: false       |
| buydata       | references | foreign_key: true |

### Association
- belongs_to: buydate