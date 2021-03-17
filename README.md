# T2A2 - Marketplace Project

A Ruby on Rails Project - created by: Roba Elshazly

To view on Heroku<br/>
please click [here](https://hireitau.herokuapp.com/) <br/>
[https://hireitau.herokuapp.com/](https://hireitau.herokuapp.com/) 

To view source code on GitHub <br/>
please click [here](https://github.com/robaElshazly/Rails-Market-place) <br/>
[https://github.com/robaElshazly/Rails-Market-place](https://github.com/robaElshazly/Rails-Market-place)

<hr>

## Table of Contents

- [Description of the project](#description-of-the-project)
- [Problem definition and purpose](#problem-definition-and-purpose)
  - [Functionality and features](#functionality-and-features)
  - [Sitemap](#sitemap)
  - [Screenshots](#screenshots)
  - [Target audience](#target-audience)
  - [Tech stack](#tech-stack)
- [User Stories](#user-stories)
- [Wireframes](#wireframes)
- [ERD](#erd)
- [High-level components](#high-level-components)
- [Third party services](#third-party-services)
- [Active record associations](#active-record-associations)
- [Database relations and Database schema](#database-relations-and-database-schema)
- [Ways task were allocated and tracked](#ways-task-were-allocated-and-tracked)

## Description of the Project

This is a ruby on rails two ways marketplace app that allow people to hire their tooles and equipments for people, and  also to hire tools they need from people.

### Problem definition and purpose
 
As a lot of people have equipments all year round with minimal use, the advantage of their equipments is minimized. While other people might be in need for these tools but only for minimal use or only for short time. This application was created to connect people connect people having tools with people needing these tools and allows them to hire their tools to each others. <br/>
This app also aims to:<br/>
* Maximize the advantage of owned equipments.
* Getting profit out of our unneeded tools.
* Help people find tools they need to hire for short time with out needing to buy them.

### Functionality and Features
* Creates users accounts that stores their information.
* Shows available items for hire without needing to log in.
* Allows users to list their items for hire after logging in.
* A booking can be made through the calender that shows only available times. 
* booking is only for lodded in users.
* A payment for booking is done through the website using Stripe.
* Show items geolocation when displaying an item.
* Booking confirnmation email.
<br/>

### Sitemap

![sitemap](docs/sitemap.png) <br/>

### Screenshots

### Target audience

The application targets people having equipments and wanting to hire them. And also people people looking for equipments and tools to hire.

### Tech Stack

The following were used to develop my application:
- Ruby on Rails
- Bootstrap
- Heroku
- Stripe
- Amazon Web Service (S3)
- Github
- Postgresql
## User Stories

#### As a User I want to be able to:

- Make an account that stores my information.
- Edit my account information at any time.
- Delete my account so my data are no longer preserved in the website server.
- View all items for hire.
- Search items that I nee to hire.
- see available times for booking.
- Make bookings and payments through the website and receive a booking confirmation email.
- Add an item for hire.
- view my items for hire.
- Edit my items for hire.
- Delete my items for hire.


## Wireframes

### Desktop Version

#### Home page
![home-wireframe](docs/home-wireframe.png)

#### Sign up page
![sign-up-wireframe](docs/signup-wireframe.png)

#### All items page
![index-wireframe](docs/index-wireframe.png)

#### Show item page
![show_item-wireframe](docs/showitem-wireframe.png)

#### My items page
![my-items-wireframe](docs/myitems-wireframe.png)

#### Add item page
![add-item-wireframe](docs/additem-wireframe.png)

#### Checkout page
![check-out-wireframe](docs/checkout-wireframe.png)

### Tablet Version

#### Home page
![home-wireframe](docs/home-wireframe.png)

#### Sign up page
![sign-up-wireframe](docs/signup-wireframe.png)

#### All items page
![index-wireframe](docs/tablet-items-wireframe.png)

#### Show item page
![show-item-wireframe](docs/tablet-showitem-wireframe.png)

#### My items page
![my-items-wireframe](docs/tablet-myitems-wireframe.png)

#### Add item page
![add-item-wireframe](docs/additem-wireframe.png)

#### Checkout page
![check-out-wireframe](docs/checkout-wireframe.png)

### Mobile Version

![mobile-wireframe](docs/mobile-wireframe.png)

## ERD
![ERD](docs/erd.png)

## High-level components

## Third party services

The following third-party services were used in the development of this application:<br/>
| Third-Party Services | Description |
| :------- | :-------------- |
| Heroku | is a container-based cloud Platform as a Service (PaaS). Developers use Heroku to deploy, manage, and scale modern apps. Our platform is elegant, flexible, and easy to use, offering developers the simplest path to getting their apps to market. We used it to host the application for testing and deployment of our app. https://www.heroku.com/ |
| AWS S3 | is a scalable, high-speed, web-based cloud storage service designed for online backup and archiving of data and applications on Amazon Web Services. Amazon S3 was designed with a minimal feature set and created to make web-scale computing easier for developers. We used it for file uploading. https://aws.amazon.com/s3/|
| Github | is a Git repository hosting service, but it adds many of its own features. While Git is a command line tool, GitHub provides a Web-based graphical interface. It also provides access control and several collaboration features, such as a wikis and basic task management tools for every project. We used it for version control and project managment. https://github.com/ |
| Gmail SMTP | a protocol for sending e-mail messages between servers. Most e-mail systems that send mail over the Internet use SMTP to send messages from one server to another. We used its setting for the Rails Active Mailer to be able to send emails. https://google.com|
| Stripe | is a technology company that builds economic infrastructure for the internet. Businesses of every size—from new startups to public companies—use our software to accept payments and manage their businesses online. We used it to handle the payment. https://stripe.com/au |

<br/>
The following Ruby on Rails gems were also used in the application:<br/>

| Ruby Gems    | Description                                                                                                                                                                                                                                                                                                                          |
| :----------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Devise       | is a flexible authentication solution for Rails based on Warden. We used it for authentication. https://github.com/heartcombo/devise |
| Pagy         | is the ultimate pagination gem that outperforms the others in each and every benchmark and comparison. We used it to create the apps pagination. https://github.com/ddnexus/pagy |
|Bootstarp|is a free, open source CSS framework |
|DotEnv|is a Ruby Gem that loads variables from a .env file into ENV when the environment is bootstrapped.|

## Active record associations

```ruby
class User < ApplicationRecord
  has_many :items
  has_many :booked_for_me, class_name:"Booking" , foreign_key: "customer_user_id"
  has_many :Booked_from_me, class_name:"Booking" , foreign_key: "owner_user_id"
end
```
 User model has a one to many relationship with the Item model (every user has many items). 
 
 Also, the User model has a one to many relationship with the Booking model, where every user has many booked_for_me bookings , and the Booking model with have customer_user_id as a foreign key referring to the user.

 And another one to many relationship with the Booking model, where every user has many booked_from_me bookings, and the Booking model with have owner_user_id as a foreign key referring to the user.

```ruby
class Category < ApplicationRecord
    has_many :items
end
```
Category model has a one to many relationship with the Item model, every category has many items.

```ruby
class PickupAddress < ApplicationRecord
    has_many :items
```
PckupAddress model has a one to many relationship with the Item model, every pickup_address has many items.

```ruby
class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :pickup_address
  accepts_nested_attributes_for :pickup_address
  has_one_attached :picture
  has_many :bookings
```
Item model has many to one relationship with the User model, i.e. every item belonges to one user and every user has many items.
Also, Item model has many to one relationship with the Category model, i.e. every item belonges to one category and every user has many categories.
Also, Item model has many to one relationship with the PickupAddress model, i.e. every item belonges to one pickup_address and every pickup_address has many items.
Also, Item model has one to many relationship with the Booking model, i.e. every item has many bookings ,and every booking belongs to one item.
```ruby
class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :customer_user , class_name:"User"
  belongs_to :owner_user , class_name:"User"
end
```
Booking model has many to one relationship with the Item model, i.e. every booking belongs to one item and every item has many bookings.<br/>
Also,Booking model has many to one relationship to the User model ,where the user is customer, i.e. every booking belongs to a customer_user.<br/>Also,Booking model has another many to one relationship to the User model ,where the user is owner, i.e. every booking belongs to an owner_user.

## Database relations and Database schema

```ruby
ActiveRecord::Schema.define(version: 2021_03_15_080920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|   # rails active_storage:install , rails db:migrate
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|   #rails g model Booking 
    t.integer "owner_user_id", null: false # foreign key referring to users table (one to many ralationship)
    t.integer "customer_user_id", null: false # foreign key referring to users table (one to many ralationship)
    t.bigint "item_id", null: false   # foreign key referring to items table (one to many ralationship)
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "start_date"    
    t.datetime "end_date"
    t.index ["item_id"], name: "index_bookings_on_item_id"
  end

  create_table "categories", force: :cascade do |t|    #rails g model  Category name:string
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|   #rails g model  Category name:string price:float description:text user:references category:references pickup_address:references
    t.string "name"
    t.float "price"
    t.text "description"
    t.bigint "user_id", null: false  #foreign key referring to User model
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false     #foreign key
    t.bigint "pickup_address_id", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["pickup_address_id"], name: "index_items_on_pickup_address_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "pickup_addresses", force: :cascade do |t|
    t.string "address"
    t.string "suburb"
    t.integer "postcode"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "items"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "pickup_addresses"
  add_foreign_key "items", "users"
end
```




