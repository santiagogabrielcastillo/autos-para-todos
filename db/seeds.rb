puts "Cleaning database"
User.destroy_all
Automobile.destroy_all

puts "Creating users and automobiles"

USERS = [{
    full_name: "Pedro Ramirez",
    email: "pedro@gmail.com",
    password: "098765"
  },
  {
    full_name: "Juan Perez",
    email: "juan@gmail.com",
    password: "123456"
  },
  {
    full_name: "Jaime Azurduy",
    email: "jaime@gmail.com",
    password: "47291085"
}]

USERS.each do |user|
  User.create!(user)
end

AUTOMOBILES = [{
    model: "AMG-GT Black Series",
    category: "Car",
    brand: "Mercedes",
    price: 2000,
    year: 2016,
    km: 30000,
    user_id: User.first.id
  },
  {
    model: "HP4 RACE",
    category: "motorcycle",
    brand: "BMW",
    price: 1000,
    year: 2019,
    km: 18000,
    user_id: User.second.id
  },
  {
    model: "Renegade",
    category: "Car",
    brand: "Jeep",
    price: 5000,
    year: 2020,
    km: 1000,
    user_id: User.second.id
  }]

AUTOMOBILES.each do |automobile|
    Automobile.create!(automobile)
end

puts "3 users and automobiles created"