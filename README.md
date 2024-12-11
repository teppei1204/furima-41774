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
| city              |   string   | null: false |
| user_id           | references | null: false, foreign_key: true|
| phone_number      |   string   | null: false |
| prefecture_id     |   string   | null: false |
| building_name     |   string   |             |
| post_code         |   string   | null: false |
| address           |   string   | null: false |

- belongs_to : cards


## cards テーブル(購入記録)

|  Column   |    Type    | Options     |
| --------- | ---------- | ----------- |
|  user     | references | null: false, foreign_key: true |
|  card_id  |   string   | null: false, foreign_key: true |

- belongs_to : user
- belongs_to : destination
- belongs_to : product

## products テーブル(商品情報)

|    Column          |    Type    | Options     |
| ------------------ | ---------- | ----------- |
| name               |   string   | null: false |
| price              |   integer  | null: false |
| description        |    text    | null: false |
| shipping_cost_id   |   integer  | null: false |
| shipping_days_id   |   integer  | null: false |
| shipping_id        |   integer  | null: false |
| user               | references | null: false, foreign_key: true |
| prefecture_id      |   integer  | null: false |
| image              |   string   | null: false |

- has_one : card
- belongs_to : user