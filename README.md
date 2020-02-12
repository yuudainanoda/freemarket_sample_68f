
This README would normally document whatever steps are necessary to get the
application up and running.
Things you may want to cover:
* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer||
|name|string|null:false|
|first_name|string|null:false|
|first_name_kana|string|null:false|
|last_name|string|null:false|
|last_name_kana|string|null:false|
|email|string|null:false,unique|
|password|string|null:false|
|telephone|integer|null:false,unique|
|prefecture_id|reference|foreign_key: true|
|city|string|null:false|
|adress|string|null:false|
|building|string||
|zip_code|integer|null:false|
|introduction|text||
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
|birth_is_vaild|boolean(0)||
|reset_password_token|string||
|reset_password_sent_at|dyatime||
|user_icon|text||
|point_amount|integer||
|profit_amount|integer||


### Association
- has_many :items
- has_many :orders
- has_many :profits
- has_many :points
- has_many :messages
- has_many :likes
- has_many :flags
- has_many :message_items,through::messages,source::item
- has_many :like_items,through::likes,source::item
- has_many :flag_items,through::flags,source::item
- belongs_to :prefecture
- belongs_to :rate


## ratesテーブル

|Column|Type|Options|
|------|----|-------|
|id|||
|rating|string||

### Association
- has_many :items
- has_many :users


## rate_countsテーブル

|Column|Type|Options|
|------|----|-------|
|id|||
|rating_id|reference|foreign_key: true|
|user_id|reference|foreign_key: true|
|item_id|reference|foreign_key: true|
|message|text|null:false|
|seller|boolean||


### Association
- has_many :items
- has_many :users


## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|id|||
|prefecture|string|null:false,unique|

### Association
- has_many :items
- has_many :users


## pointsテーブル

|Column|Type|Options|
|------|----|-------|
|id|||
|amount|integer||
|user_id|reference|foreign_key: true|
|point_status_id|reference|foreign_key: true|

### Association
- belongs_to :user


## point_statusテーブル

|Column|Type|Options|
|------|----|-------|
|id|||
|point_status|string||

### Association
- has_many :points


## profitsテーブル

|Column|Type|Options|
|------|----|-------|
|id|||
|prpfit|integer||
|user_id|reference|foreign_key: true|
|item_id|reference|foreign_key: true|
|expiration_date|daytime||
|profit_is_vaild|boolean||

### Association
- belongs_to :item
- belongs_to :user


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|id|||
|message|text||
|user_id|reference|foreign_key: true|
|item_id|reference|foreign_key: true|
|seller|boolean||
|order_status_id|reference|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user
- belongs_to :order_status


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|id|||
|user_id|reference|foreign_key: true|
|item_id|reference|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


## flagsテーブル

|Column|Type|Options|
|------|----|-------|
|id|||
|user_id|reference|foreign_key: true|
|item_id|reference|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|id|integer||
|user_id|reference|null:false,foreign_key:ture|
|name|string|null:false|
|price|integer|null:false|
|description|text|null:false|
|category1_id|reference|foreign_key:true|
