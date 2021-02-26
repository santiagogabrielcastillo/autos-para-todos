require "open-uri"

puts "Cleaning database"
Booking.destroy_all
Automobile.destroy_all
User.destroy_all

puts "Creating users and automobiles"

user = User.new(
  full_name: "Pedro Ramirez",
  email: "pedro@gmail.com",
  password: "098765",
)
file = URI.open('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb')
user.photo.attach(io: file, filename: "#{user.full_name}.png", content_type: 'image/png')

user.save!

user = User.new(
    full_name: "Juan Perez",
    email: "juan@gmail.com",
    password: "123456",
  )
  file = URI.open('https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Tynan-Allan.jpeg')
  user.photo.attach(io: file, filename: "#{user.full_name}.png", content_type: 'image/png')
  
user.save!

user = User.new(
    full_name: "Juana Azurduy",
    email: "jaime@gmail.com",
    password: "47291085",
  )
  file = URI.open('https://images.squarespace-cdn.com/content/v1/592738c58419c2fe84fbdb81/1572790015376-OMSFC6ZF726GPDICFIST/ke17ZwdGBToddI8pDm48kJUlZr2Ql5GtSKWrQpjur5t7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UfNdxJhjhuaNor070w_QAc94zjGLGXCa1tSmDVMXf8RUVhMJRmnnhuU1v2M8fLFyJw/Claire_webCL_6902.jpg?format=1000w')
  user.photo.attach(io: file, filename: "#{user.full_name}.png", content_type: 'image/png')
  
user.save!
  
automobile = Automobile.new(
  model: "AMG-GT Black Series",
  category: "Car",
  brand: "Mercedes",
  price: 2000,
  year: 2016,
  km: 30000,
  address: "Niceto Vega 5510, Buenos Aires, Argentina",
  user_id: User.first.id
)
file = URI.open('https://cdn.motor1.com/images/mgl/BoB2M/s1/2020-mercedes-amg-gt-black-series-rendering.jpg')
automobile.photo.attach(io: file, filename: "#{automobile.model}.png", content_type: 'image/png')

automobile.save!

automobile = Automobile.new(
  model: "HP4 RACE",
  category: "motorcycle",
  brand: "BMW",
  price: 1000,
  year: 2019,
  km: 18000,
  address: "Avenida Alvear 1661, Buenos Aires, Argentina",
  user_id: User.second.id
)
file = URI.open('https://s3-eu-west-1.amazonaws.com/crash.net/visordown.com/field/image/BMW%20HP4%20Race%202017.jpg')
automobile.photo.attach(io: file, filename: "#{automobile.model}.png", content_type: 'image/png')
  
automobile.save!

automobile = Automobile.new(
  model: "Renegade",
  category: "Car",
  brand: "Jeep",
  price: 5000,
  year: 2020,
  km: 1000,
  address: "Mariscal Antonio José de Sucre 1683, Buenos Aires",
  user_id: User.first.id
)
file = URI.open('https://k.uecdn.es/html5/html5lib/v2.73.3_ue_1/modules/KalturaSupport/thumbnail.php/p/110/uiconf_id/14969339/entry_id/0_44j7x3m8/height/407?"')
automobile.photo.attach(io: file, filename: "#{automobile.model}.png", content_type: 'image/png')
  
automobile.save!

automobile = Automobile.new(
  model: "Model S",
  category: "Car",
  brand: "Tesla",
  price: 1300,
  year: 2018,
  km: 28000,
  address: "Juramento 2356, Buenos Aires, Argentina",
  user_id: User.second.id
)
file = URI.open('https://smartcdn.prod.postmedia.digital/driving/wp-content/uploads/2019/04/model-s-001.jpg')
automobile.photo.attach(io: file, filename: "#{automobile.model}.png", content_type: 'image/png')

automobile.save!

automobile = Automobile.new(
  model: "Tacoma",
  category: "Truck",
  brand: "Toyota",
  price: 250,
  year: 2011,
  km: 180000,
  address: "Avellaneda 2764, Buenos Aires, Argentina",
  user_id: User.first.id
)
file = URI.open('https://www.gannett-cdn.com/-mm-/1b5f6beb15f740eb5675dfc99dd3a703df3d4d6c/c=100-0-2560-1384/local/-/media/2021/01/12/Cheboygan/ghows-MI-200829667-cce2450b.jpg')
automobile.photo.attach(io: file, filename: "#{automobile.model}.png", content_type: 'image/png')

automobile.save!

automobile = Automobile.new(
  model: "GT86",
  category: "Car",
  brand: "Toyota",
  price: 450,
  year: 2012,
  km: 76000,
  address: "Fraga 1246, Buenos Aires, Argentina",
  user_id: User.third.id
)
file = URI.open('https://cdn1.buyacar.co.uk/sites/buyacar/files/2012toyotagt86front.jpg')
automobile.photo.attach(io: file, filename: "#{automobile.model}.png", content_type: 'image/png')

automobile.save!

automobile = Automobile.new(
  model: "2500 Power Wagon",
  category: "Truck",
  brand: "RAM",
  price: 1450,
  year: 2019,
  km: 135000,
  address: "Av. Gaona 2678, Buenos Aires, Argentina",
  user_id: User.third.id
)
file = URI.open('https://autotest.com.ar/wp-content/uploads/2020/11/RAM-POWER-WAGON.jpg')
automobile.photo.attach(io: file, filename: "#{automobile.model}.png", content_type: 'image/png')

automobile.save!

automobile = Automobile.new(
  model: "Fiesta ST",
  category: "Car",
  brand: "Ford",
  price: 300,
  year: 2013,
  km: 120000,
  address: "3 de Febrero 2178, Buenos Aires, Argentina",
  user_id: User.third.id
)
file = URI.open('https://s1.cdn.autoevolution.com/images/gallery/FORDFiestaST-4549_1.jpg')
automobile.photo.attach(io: file, filename: "#{automobile.model}.png", content_type: 'image/png')

automobile.save!

automobile = Automobile.new(
  model: "i8",
  category: "Car",
  brand: "BMW",
  price: 1640,
  year: 2017,
  km: 12000,
  address: "Besares 1746, Buenos Aires, Argentina",
  user_id: User.second.id
)
file = URI.open('https://cdn.motor1.com/images/mgl/o6ymp/s1/bmw-i8.jpg')
automobile.photo.attach(io: file, filename: "#{automobile.model}.png", content_type: 'image/png')

automobile.save!

puts "3 users and 9 automobiles created"