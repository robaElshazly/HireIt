# T2A2 - Marketplace Project

A Ruby on Rails Project - created by: Roba Elshazly

To view on Heroku<br/>
please click [here](https://hireitau.herokuapp.com/) <br/>
[https://hireitau.herokuapp.com/](https://hireitau.herokuapp.com/) 

To view source code on GitHub <br/>
please click [here](https://github.com/robaElshazly/Rails-Market-place) <br/>
[https://github.com/robaElshazly/Rails-Market-place](https://github.com/robaElshazly/Rails-Market-place)

To veiw trello board<br/>
please click [here](https://trello.com/b/oVDj2FWS/rubyonrails-market-place)
<hr>

## Instructions of setup:

* $git clone "this github repo"

* $cd rails-practice-project

* $yarn install --check-files

* $bundle

* $rails db:create

* $rails db:migrate

* $rails db:seed

* $rails s

The testing users credentials are:<br/>
First user:<br/>
email: lina@hireit18.com<br/>
password: 123456

Second user:<br/>
email: james@hireit18.com<br/>
password: 123456



### Note : Environment varialbes used from my .ENV, the file is not pushed to this repo, which might cause some services , like AWS for hosting images , to not work properly.




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
- [Database relations](#database-relations)
- [Database schema](#database-schema)
- [Ways task were allocated and tracked](#ways-task-were-allocated-and-tracked)
- [Introduction for the website Video](#Introduction-for-the-website-Video)

## Description of the Project

This is a ruby on rails two ways marketplace app that enables you to hire your tools and equipments for people, and  also to hire tools you need from people.

### Problem definition and purpose
 
This application was created to facilitate hiring your tools for others who need them, and help you maximize the advantage of your equipments. 
On the other hand it helps you find items you need to hire without having to buy them.
 <br/>
This app also aims to:<br/>
* Maximize the advantage of owned equipments.
* Help Make a profit from unused tools.
* Help people find tools they need to hire for minimal use without having to purchase them.

### Functionality and Features
* Creates users accounts that store their information.
* Shows available items for hire without needing to log in.
* Allows users to list their items for hire after logging in.
* A booking can be made through the calender that shows only available times. 
* Booking can only be made by logged in users.
* A payment for booking is done through the website using Stripe.
* Shows item's geolocation when displaying an item.
* Booking confirmation email.
<br/>

### Sitemap

![sitemap](docs/sitemap.png) <br/>

### Screenshots
![screenshot](docs/ss1.png)

![screenshot](docs/ss2.png)

![screenshot](docs/ss3.png)

![screenshot](docs/ss4.png)

![screenshot](docs/ss5.png)

![screenshot](docs/ss6.png)

![screenshot](docs/ss7.png)

![screenshot](docs/ss8.png)

![screenshot](docs/ss9.png)

![screenshot](docs/ss10.png)

### Target audience

The application targets people having equipments and wanting to hire them. And also people looking for equipments and tools to hire.

### Tech Stack

The following were used to develop my application:
- Ruby on Rails
- JS, CSS, HTML.
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
- See available times for booking.
- Make bookings and payments through the website and receive a booking confirmation email.
- If I try to make a booking without being logged in, I'll be dirested to the sign in page.
- Add an item for hire.
- View my items for hire.
- Edit and Delete  my items for hire.


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

The app consists of routes, controllers, veiws and models. The routes include all the URLs for the app like  creating, editng ,deleting and viewing a single item and also for viewing all items.<br/>
 It also includes routes for sigining in and editing the user information and deleting the account.The route directs to the right controller action that performs all the logic of CRUD operations on the data and then render the right view after each action. The controllers perform operations on data coming from the model.<br/>
 Models are a representation for the database tables and is used to load the data from the database when needed. In this app, there is a user model, item model, category model, pickup address model and a booking model. <br/>
 The controllers are bookings, categories,home,items and users controller.<br/>
 bookings, categories and items controllers perform the CRUD operations for the corrosponding model.<br/>
 The user controller is used to view the items owned by the user, and the home controller is used to render the home page.
 Layout views has application.html.erb file that renders by default when any controller action method renders a veiw , but it changes the content and loads the relevent page that the controller action is asking for. Also there are partial views that can be used in any other views when needed. In this app there is the nav, category-list ,search-form and item-card partial views. nav and category list partial views are used in the application view to be loaded in all the views.

## Third party services

The following third-party services were used in the development of this application:<br/>
| Third-Party Services | Description |
| :------- | :-------------- |
| Heroku | is a container-based cloud Platform as a Service (PaaS). Developers use Heroku to deploy, manage, and scale modern apps. Our platform is elegant, flexible, and easy to use, offering developers the simplest path to getting their apps to market. We used it to host the application for testing and deployment of our app. https://www.heroku.com/ |
| AWS S3 | is a scalable, high-speed, web-based cloud storage service designed for online backup and archiving of data and applications on Amazon Web Services. Amazon S3 was designed with a minimal feature set and created to make web-scale computing easier for developers. We used it for file uploading. https://aws.amazon.com/s3/|
| Github | is a Git repository hosting service, but it adds many of its own features. While Git is a command line tool, GitHub provides a Web-based graphical interface. It also provides access control and several collaboration features, such as a wikis and basic task management tools for every project. We used it for version control and project managment. https://github.com/ |
| Gmail SMTP | a protocol for sending e-mail messages between servers. Most e-mail systems that send mail over the Internet use SMTP to send messages from one server to another. We used its setting for the Rails Active Mailer to be able to send emails. https://google.com|
| Stripe | is a technology company that builds economic infrastructure for the internet. Businesses of every size—from new startups to public companies—use our software to accept payments and manage their businesses online. We used it to handle the payment. https://stripe.com/au |
|Google Maps Embed API| to place an interactive map in each item show page https://developers.google.com/maps/documentation/embed/get-started#streetview |
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
Every item has one attachment
```ruby
class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :customer_user , class_name:"User"
  belongs_to :owner_user , class_name:"User"
end
```
Booking model has many to one relationship with the Item model, i.e. every booking belongs to one item and every item has many bookings.<br/>
Also,Booking model has many to one relationship to the User model ,where the user is customer, i.e. every booking belongs to a customer_user.<br/>Also,Booking model has another many to one relationship to the User model ,where the user is owner, i.e. every booking belongs to an owner_user.

## Database-relations

Database relations:
- One to many relationship between users table and items table through user_id foreign key in items table. i.e. every user has many items and every item belongs to one user.
- One to many relationship between items table and categories table through category_id in items table. i.e. every category has many items and every item belongs to one category.
- One to many relationship between pickup_addresses table and items table through pickup_address_id foreign key in items table. i.e. every pickup_address has many items and every item belongs to one pickup_address.
- One to many relationship between bookings table and items table through item_id foreign key in bookings table. i.e. every item has many bookings and every booking belongs to one item.
- One to many relationship between useres table and bookings table through customer_user_id foreign key in bookings table.
- Another One to many relationship between useres table and bookings table through owner_user_id foreign key in bookings table.

The last two points resemble a many to many relationship from the users table to itself through the bookings table. i.e. every user( referring owner_user_id in bookings table) has many users(customer_user) and every user(customer_user) has many users(owner_user).
 

## Database schema
The schema.rb file is a generated file from running rails db:migrate that runs all the migrations that include commands for creating the database tables. the migrate command is when the tables are actually created in the database.  the schema is an emplementation for the ERD.

```ruby
ActiveRecord::Schema.define(version: 2021_03_15_080920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|   # this table is generated by rails active storage to handle the images storage
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t| # also an active storage table
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

  create_table "active_storage_variant_records", force: :cascade do |t|  #active storage tabel
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bookings", force: :cascade do |t|   #create the bookings table in the database
   #create the table fields and specify the data types
    t.integer "owner_user_id", null: false # foreign key referring bookings to users table for owner users,one to many ralationship, every user(as owner i.e. referred by an owner_user_id in bookings) has many bookings)
    t.integer "customer_user_id", null: false # foreign key referring bookings table to users table for customer users one to many ralationship.every user(as customer i.e. referred by an customer_user_id in bookings) has many bookings)
    t.bigint "item_id", null: false   # foreign key referring to items table (one to many ralationship),an item can be in many bookings,a booking belong to one item.
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "start_date"    
    t.datetime "end_date"
    t.index ["customer_user_id"], name: "index_bookings_on_customer_user_id" #bookings table is indexed on foriegn keys to speed up looking for the records by the foreign keys.
    t.index ["item_id"], name: "index_bookings_on_item_id"
    t.index ["owner_user_id"], name: "index_bookings_on_owner_user_id"
  end

  create_table "categories", force: :cascade do |t|    #create the categories tabel in the database
   #create the table fields and specify the data types
   t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|  #create the items tabel in the database
    #create the table fields and specify the data types
    t.string "name"
    t.float "price"
    t.text "description"
    t.bigint "user_id", null: false  #foreign key referring to users table(a user has many items,every item belongs to a user)
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false     #foreign key referring to categories table (a category has many items every item belongs to a category)
    t.bigint "pickup_address_id", null: false #foreign key referring to pickup_addresses table model(pickup address has many items every item belongs to a pickup address)
    t.index ["category_id"], name: "index_items_on_category_id" #itemss table is indexed on foriegn keys to speed up looking for the records by the foreign keys.
    t.index ["pickup_address_id"], name: "index_items_on_pickup_address_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "pickup_addresses", force: :cascade do |t|  #create the pickup address table
   #create the table fields and specify the data types
   t.string "address"
    t.string "suburb"
    t.integer "postcode"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|   #create the users table , the migration resposible for this is generated by devise gem.
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
   
   # adding the foriegn key constraint to all columns chosen to be a foriegn key
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "items" #column item_id will be a foreign key in bookings tabel referring to items table
  add_foreign_key "bookings", "users", column: "customer_user_id" #column customer_user_id will be a foreign key in bookings tabel referring to users table
  add_foreign_key "bookings", "users", column: "owner_user_id" #column owner_user_id will be a foreign key in bookings tabel referring to users table
  add_foreign_key "items", "categories" #column category_id will be a foreign key in items tabel referring to categories table
  add_foreign_key "items", "pickup_addresses" #column pickup_address_id will be a foreign key in items table referring to pickup_addresses table
  add_foreign_key "items", "users" #column user_id will be a foreign key in itemss tabel referring to users table
end
```

## Ways task were allocated and tracked

![trello](docs/market-place-trello-1.png)

![trello](docs/market-place-trello-2.png)

![trello](docs/market-place-trello-3.png)

![trello](docs/market-place-trello-4.png)

![trello](docs/market-place-trello-5.png)

## Introduction for the website Video

[![watch](https://img.youtube.com/vi/m4B8MlSTJVs/0.jpg)](https://youtu.be/m4B8MlSTJVs)


