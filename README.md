# README

## usersテーブル

| Colum      | Type       | Options     |
| ---------- | ---------- | ----------- |
| email      | string     | null: false |
| password   | string     | null: false |
| nickname   | string     | null: false |
| fname      | string     | null: false |
| lname      | string     | null: false |
| fkata      | string     | null: false |
| lkata      | string     | null: false |
| birth      | integer    | null: false |

### Association
- has_many: comment
- has_many: product


## productテーブル

| Colum      | Type       | Options     |
| ---------- | ---------- | ----------- |
| title      | string     | null: false |
| price      | integer    | null: false |
| user       | references |             |
| category   | string     | null: false |
| state      | text       | null: false |
| shipping   | integer    | null: false |
| prefecture | string     | null: false |
| wait-day   | integer    | null: false |
| brand      | references |             |
| sold-out   | boolean    |             |

### Association
- has_many: comment
- belong_to: user
- belong_to: brand


## commentsテーブル

| Colum      | Type       | Options     |
| ---------- | ---------- | ----------- |
| text       | text       | null: false |
| user       | references |             |
| product    | references |             |

### Association
- belong_to: user
- belong_to: product


## brandテーブル

| Colum      | Type       | Options     |
| ---------- | ---------- | ----------- |
| name       | string     | null: false |
| product    | references |             |

### Association
- has_many: product