# README

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
|introduction|text||
|birth_year|integer|null:false|
|birth_month|integer|null:false|
|birth_day|integer|null:false|
|user_icon|text||
|point_amount|integer||
|profit_amount|integer||


### Association
- has_many :items, dependent: :destroy
- has_many :orders, dependent: :destroy
- has_many :profits, dependent: :destroy
- has_many :points, dependent: :destroy
- has_many :messages, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :addresses, dependent: :destroy
- has_many :message_items,through::messages,source::item, dependent: :destroy
- has_many :like_items,through::likes,source::item, dependent: :destroy
- belongs_to :rate


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer||
|prefecture|reference|foreign_key: true|
|city|string|null:false|
|address|string|null:false|
|building|string||
|zip_code|integer|null:false|

### Association
- has_many :items, dependent: :destroy
- has_many :orders, dependent: :destroy
- belongs_to :user


## ratesテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|rating|string||

### Association
- has_many :items, dependent: :destroy
- has_many :users, dependent: :destroy


## rate_countsテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|rating_id|reference|foreign_key: true|
|user_id|reference|foreign_key: true|
|order_id|reference|foreign_key: true|
|message|text||


### Association
- has_many :users, dependent: :destroy
- has_many :orders, dependent: :destroy


## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|amount|integer||


### Association
- belongs_to :user


## profitsテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|profit|integer||
|user_id|reference|foreign_key: true|
|item_id|reference|foreign_key: true|
|trade_end_date|daytime||

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


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer||
|user_id|reference|null:false,foreign_key:ture|
|name|string|null:false|
|price|integer|null:false|
|description|text|null:false|
|category_id|reference|foreign_key:true|
|brand_id|reference|foreign_key:true|
|size_id|reference|foreign_key:true|
|condition_id|reference|foreign_key:true|
|delivery_charge_id|reference|foreign_key:true|
|address_id|reference|foreign_key:true|
|delivery_dates_id|reference|foreign_key:true|
|order_status_id|reference|foreign_key:true|


### Association
- has_many :item_images, dependent: :destroy
- has_many :messages, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :message_users,through::messages,source::user, dependent: :destroy
- has_many :like_users,through::likes,source::user, dependent: :destroy
- has_one :profit
- belongs_to :order
- belongs_to :address
- belongs_to :user
- belongs_to :brand
- belongs_to :condition
- belongs_to :delivery_charge
- belongs_to :delivery_date
- belongs_to :order_status
- belongs_to :size
- belongs_to :category


## item_imageテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|image|text|null:false|
|item_id|reference|null:false,foreign_key:true|


### Association
- belongs_to :item


## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer||
|user_id|reference|null:false,foreign_key:ture|(buyer)
|item_id|reference|null:false,foreign_key:ture|
|item.user_id|reference|null:false,foreign_key:ture|(seller)


### Association
- has_many :rate_counts, dependent: :destroy
- belongs_to :user
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|category|string|null:false|
|ancestry|string|null:false|


### Association
- has_many :items, dependent: :destroy


## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|size_category_id|reference|foreign_key:ture|
|size|string|null:false|


### Association
- belongs_to :size_category
- has_many :items, dependent: :destroy


## size_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|size_category|string||


### Association
- has_many :sizes


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|brand|string|unique|

### Association
- has_many :items, dependent: :destroy


## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|condition|string||

### Association
- has_many :items, dependent: :destroy


## delivery_chargesテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|charge|string||

### Association
- has_many :items, dependent: :destroy


## delivery_datesテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|date|string||


### Association
- has_many :items, dependent: :destroy


## order_statusesテーブル
|Column|Type|Options|
|------|----|-------|
|id|||
|order_status|string||


### Association
- has_many :items, dependent: :destroy
- has_many :messages, dependent: :destroy