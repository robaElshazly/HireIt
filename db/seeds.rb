# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name:'Test',email: 'test-user@hireit.com', password: '123456')
u1=User.create(name:'James',email: 'James@hireit.com', password: '123456')
u2=User.create(name:'Lina',email: 'Lina@hireit.com', password: '123456')
c1=Category.create(name: 'Home')
c2=Category.create(name: 'Garden')
c3=Category.create(name: 'Cleaning')
c4=Category.create(name: 'Removal')
c5=Category.create(name: 'Electronic Gadgets')
add1=PickupAddress.create(address: '20 Somervell st',suburb: 'Annerley',postcode: '4103',state: 'QLD')
add2=PickupAddress.create(address: '102 Adelaide St',suburb: 'Brisbane City',postcode: '4000',state: 'QLD')

#creating items #1
i1=Item.create(name: 'Mower tractor',price: 50.0,description: "Reliable tractor to the mowing job done quickly.",user_id: u1.id,category_id: c2.id,pickup_address_id: add1.id)

i1.picture.attach(
    io: File.open("app/assets/images/seed/mower.webp"), 
    filename: "mower.webp", 
    content_type: 'image/webp'
)

#creating items #2

i2=Item.create(name: 'Trailer',price: 20,description: "for hire 5x7 heavy duty trailer",user_id: u2.id,category_id: c4.id,pickup_address_id: add2.id)

i2.picture.attach(
    io: File.open("app/assets/images/seed/trailer.jpg"), 
    filename: "trailer.jpg", 
    content_type: 'image/jpg'
)

#creating items #3

i3=Item.create(name: 'Mavic air drone',price: 20,description: "For hire mavic air drone",user_id: u2.id,category_id: c5.id, pickup_address_id: add2.id)

i3.picture.attach(
    io: File.open("app/assets/images/seed/drone.jpg"), 
    filename: "drone.jpg", 
    content_type: 'image/jpg'
)

#creating items #4
i4=Item.create(name: 'Portable air conditioner',price: 10,description: "8,000 BTUs (14,000 BTU ASHRAE) provides strong cooling power
3 fan levels: low, medium and high. Also features an auto-fan setting when in the cooling mode which adjusts the fan speed as is appropriate.", user_id: u1.id,category_id: c1.id,pickup_address_id: add1.id)

i4.picture.attach(
    io: File.open("app/assets/images/seed/ac.jpg"), 
    filename: "ac.jpg", 
    content_type: 'image/jpg'
)

#creating items #5

i5=Item.create(name: 'Lawn Mower',price: 20,description: "For hire Honda Machine, 4-Stroke HRU196D",user_id: u2.id,category_id: c2.id,pickup_address_id: add2.id)

i5.picture.attach(
    io: File.open("app/assets/images/seed/mower.jpg"), 
    filename: "mower.jpg", 
    content_type: 'image/jpg'
)

#creating items #6

i5=Item.create(name: '4 tables and 30 chairs',price: 20,description: "tables and chairs For party or picnic setting",user_id: u2.id,category_id: c5.id,pickup_address_id: add2.id)

i5.picture.attach(
    io: File.open("app/assets/images/seed/table.png"), 
    filename: "table.png", 
    content_type: 'image/png'
)


Booking.create(owner_user_id: 3,customer_user_id: 2,start_date: Date.today,end_date: Date.tomorrow,item_id:3)