
puts "Creating products..."

Product.create(name: "Unicorns", price: 100.0)
Product.create(name: "Cats", price: 200.0)
Product.create(name: "Hoodie", price: 200.0)
Product.create(name: "Mr Robot mask", price: 300.0)
Product.create(name: "Antena", price: 400.0)
Product.create(name: "Cool keyboard", price: 500.0)

puts "Creating basic user.."

User.create(name: "Cosme Fulanito", email: "cosme@hackerschool.com", password: "password", password_confirmation: "password")
