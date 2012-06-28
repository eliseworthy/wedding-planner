# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([
  {name: "Bridal Gown"},
  {name: "Venue"},
  {name: "Honeymoon"},
  {name: "Ring"},
  {name: "Bridesmaids"},
  {name: "Decorations"},
  {name: "Floral"},
  {name: "Cake"},
  {name: "Invitations"}
])

weddings = Wedding.create([
  {name: "My dream Hawaiian Wedding", user_id: 1, description: "At sunset on the beach, bridesmaids in hawaiian dresses."},
  {name: "Wedding in Scotland", user_id: 1, description: "Traditional wedding in an ancient church."},
  {name: "Garden Wedding", user_id: 1, description: "Handmade accessories and lots of friends!"},
  {name: "Mexico Wedding", user_id: 1, description: "Our closests family and friends at a resort."},
  {name: "Ranch Wedding", user_id: 1, description: "Renting a farmhouse!"},
  {name: "Chinese Wedding", user_id: 1, description: "We're going with two ceremonies: one western, one traditional!"},
  {name: "Mansion Wedding", user_id: 1, description: "A beautiful summertime wedding."},
  {name: "Wedding at the Science Center", user_id: 1, description: "With the dinosaurs!"}
  ])

items = Item.create([
  {description: "The most beautiful gown", wedding_id: weddings.first.id, photo_url: "http://media-cache-ec3.pinterest.com/upload/216102482089106321_z4dl8AIk.jpg"},
  {description: "Love this headband!", wedding_id: weddings.first.id, photo_url: "http://media-cache-ec7.pinterest.com/upload/34128909646260764_XxdeRa4a.jpg"},
  {description: "Beading ideas", wedding_id: weddings.first.id, photo_url: "http://media-cache-ec5.pinterest.com/upload/187673509442124237_WgMXqQeB.jpg"}
  ])