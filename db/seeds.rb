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
  {name: "My beautiful Hawaiian Weddding", user_id: 1, description: "On the beach"},
  {name: "Wedding in Scotland", user_id: 1, description: "Lots of beer!"},
  {name: "My wedding on the moon", user_id: 1, description: "It'll happen someday"},
  {name: "Wedding in the backyard", user_id: 1, description: "Going cheap"},
  {name: "Wedding in the backyard 2", user_id: 1, description: "Going cheap"},
  {name: "Wedding in the backyard 3", user_id: 1, description: "Going cheap"},
  {name: "Wedding in the backyard 4", user_id: 1, description: "Going cheap"},
  {name: "Wedding in the backyard 5", user_id: 1, description: "Going cheap"}
  ])

items = Item.create([
  {name: "The most beautiful gown", wedding_id: weddings.first.id, category_id: categories.first.id, description: "I love it"},
  {name: "Pricess-like", wedding_id: weddings.first.id, category_id: categories.first.id, description: "So pretty"},
  {name: "Mom's dress", wedding_id: weddings.first.id, category_id: categories.first.id, description: "I'm going to get it updated"}
  ])