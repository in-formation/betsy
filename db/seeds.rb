require 'csv'

users = [
  {
    name: "Judy Ruliani",
    email: "jrud@msn.com"
  },
  {
    name: "Doug Judy",
    email: "djud@gmail.com"
  },
  {
    name: "The Vulture",
    email: "vulture@email.com"
  }
]

users.each do |user|
  User.create(user)
end
puts "Added #{User.count} user records"


categories = [
  {
    name: "politics"
  },
  {
    name: "lifestyle"
  },
  {
    name: "misc"
  }
]

categories.each do |category|
  Category.create(category)
end
puts "Added #{Category.count} user records"

products = [
  {
    qty: 500,
    name: "Votes",
    price: 150.00,
    description: "Struggling to get support on your terrible healthcare plan? Don't sweat it. We have the right amount votes to push you over the edge.",
    status: "Active",
    user_id: rand(1..3)
  },
  {
    qty: 1,
    name: "Ted Cruz",
    price: 100.00,
    description: "Once the prince charming of the party, Lyin' Ted can help get you a small margin of votes and maybe a latte or two.",
    status: "Active",
    user_id: rand(1..3)
  },
  {
    qty: 1,
    name: "Mitt Romney",
    price: 15.00,
    description: "A deal! Act fast or he might strap your dog to the roof of his Subaru Outback and go on a road trip to Mount Zion!",
    status: "Active",
    user_id: rand(1..3)
  },
  {
    qty: 2,
    name: "Greenland",
    price: 200.00,
    description: "Is it Greenland or Iceland? Who knows. Either way, a great distraction while you're getting an impeached.",
    status: "Active",
    user_id: rand(1..3)
  },
  {
    qty: 10,
    name: "Yacht",
    price: 500.00,
    description: "Just your generic yacht. Not much else to add.",
    status: "Retired",
    user_id: rand(1..3)
  },
  {
    qty: 5,
    name: "Media Company",
    price: 400.00,
    description: "Low in stock! Don't wait to scare all the senior citizens that sharia law has arrived in Cleveland!",
    status: "Active",
    user_id: rand(1..3)
  },
  {
    qty: 60,
    name: "Gold Toliet",
    price: 100.00,
    description: "How rich are you if you don't even have enough one of these?",
    status: "Active",
    user_id: rand(1..3)
  },
  {
    qty: 1,
    name: "A.G. Bill Barr",
    price: 25.00,
    description: "In a pinch? Don't worry, this dude will defend your every sin and deny being present in the room while it happened.",
    status: "Active",
    user_id: rand(1..3)
  },
  {
    qty: 10,
    name: "Endangered Rhino Horn",
    price: 1000.00,
    description: "Limited time only! The last of its kind! Won't return for sale!",
    status: "Active",
    user_id: rand(1..3)
  }
]

products.each do |product|
  Product.create(product)
end
puts "Added #{Product.count} product records"


# USER_FILE = Rails.root.join('db', 'user-seeds.csv')
# puts "Loading raw user data from #{USER_FILE}"

# user_failures = []
# CSV.foreach(USER_FILE, :headers => true) do |row|
#   user = User.new
#   user.id = row['id']
#   user.name = row['name']
#   user.email = row['email']
#   binding.pry
#   successful = user.save

#   if !successful
#     user_failures << user
#     puts "Failed to save user: #{user.inspect}"
#   else
#     puts "Created user: #{user.inspect}"
#   end
# end

# puts "#{user_failures.length} users failed to save"

# PRODUCT_FILE = Rails.root.join('db','product-seeds.csv')
# puts "Loading raw product data from #{PRODUCT_FILE}"

# i = 1
# product_failures = []
# CSV.foreach(PRODUCT_FILE, :headers => true) do |row|
#   product = Product.new
#   product.id = i
#   product.name = row['name']
#   product.qty = row['qty'].to_i
#   product.price = row['price'].to_f
#   product.description = row['description']
#   product.status = row['status']
#   successful = product.save
#   if !successful
#     product_failures << product
#     puts "Failed to save product #{product.inspect}"
#   else
#     puts "Created product: #{product.inspect}"
#   end
#   i += 1
# end

# puts "#{product_failures.length} products failed to save"

# puts "Manually resetting PK sequence on each table"
# ActiveRecord::Base.connection.tables.each do |t|
#   ActiveRecord::Base.connection.reset_pk_sequence!(t)
# end

puts "done"