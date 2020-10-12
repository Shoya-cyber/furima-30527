# テーブル設計

## users テーブル

|  Column               |  Type     |  Option        |
|  -------------------  |  -------- |  ------------  |
|  nickname             |  string   |  null:  false  |
|  email                |  string   |  null:  false  |
|  password             |  string   |  null:  false  |
|  family_name          |  string   |  null:  false  |
|  first_name           |  string   |  null:  false  |
|  family_name_reading  |  string   |  null:  false  |
|  first_name_reading   |  string   |  null:  false  |
|  birth_date           |  date     |  null:  false  |

### Association

- has_many :items
- has_many :orders

## items テーブル

|  Column                 |  Type         |  Option                           |
|  ---------------------  |  -----------  |  -------------------------------  |
|  name                   |  string       |  null:  false                     |
|  info                   |  text         |  null:  false                     |
|  category_id            |  integer      |  null:  false                     |
|  sales_status_id        |  integer      |  null:  false                     |
|  shipping_fee_status_id |  integer      |  null:  false                     |
|  prefecture_id          |  integer      |  null:  false                     |
|  scheduled_delivery_id  |  integer      |  null:  false                     |
|  price                  |  integer      |  null:  false                     |
|  user                   |  references   |  null:  false, foreign_key: true  |

### Association

- belongs_to :user
- has_one :order

## addresses テーブル

|  Column                 |  Type         |  Option                           |
|  ---------------------  |  -----------  |  -------------------------------  |
|  postal_coda            |  string       |  null:  false                     |
|  prefecture_id          |  integer      |  null:  false                     |
|  city                   |  string       |  null:  false                     |
|  house_number           |  string       |  null:  false                     |
|  building_name          |  string       |                                   |
|  phone_number           |  string       |  null:  false                     |
|  order                  |  references   |  null:  false, foreign_key: true  |


### Association

- belongs_to :order

## orders テーブル

|  Column                 |  Type         |  Option                           |
|  ---------------------  |  -----------  |  -------------------------------  |
|  user                   |  references   |  null:  false, foreign_key: true  |
|  item                   |  references   |  null:  false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item