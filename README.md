## users テーブル(ユーザー情報)

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nick_name            | string | null: false |
| email                | string | null: false, unique: true ,default: ""|
| encrypted_password   | string | null: false, default: ""|
| first_name           | string | null: false |
| last_name            | string | null: false |
| birth_day            |  date  | null: false |

### Association
- has_many : products
- has_many : cards


## destinations テーブル(発送先情報)

|    Column         |    Type    | Options     |
| ----------------- | ---------- | ----------- |
| first_name        |   string   | null: false |
| last_name         |   string   | null: false |
| city              |   string   | null: false |
| user_id           | references | null: false, foreign_key: true|
| phone_number      |   string   | null: false |
| prefecture        |   string   | null: false |
| building_name     |   string   | null: false |
| post_code         |   string   | null: false |
| address           |   string   | null: false |

- belongs_to : cards


## cards テーブル(購入記録)

|  Column   |    Type    | Options     |
| --------- | ---------- | ----------- |
|  user_id  | references | null: false, foreign_key: true |
|  card_id  |   string   | null: false |

- belongs_to : user
- belongs_to : destination
- belongs_to : product

## products テーブル(商品情報)

|    Column          |    Type    | Options     |
| ------------------ | ---------- | ----------- |
| name               |   string   | null: false |
| price              |   integer  | null: false |
| description        |   string   | null: false |
| shipping_cost      |   string   | null: false |
| shipping_days      |   string   | null: false |
| shipping_id        |   integer  | null: false |
| user_id            |   integer  | null: false, foreign_key: true |
| prefecture_id      |   integer  | null: false |

- has_one : card
- belongs_to : user