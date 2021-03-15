# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: 'Home')
Category.create(name: 'Garden')
Category.create(name: 'Cleaning')
Category.create(name: 'Removal')
Category.create(name: 'Electronic Gadgets')
add1=PickupAddress.create(address: '20 sommervill st',suburb: 'Annerly',postcode: '4103',state: 'QLD')
add2=PickupAddress.create(address: '102 Adelaide St',suburb: 'Brisbane City',postcode: '4000',state: 'QLD')
