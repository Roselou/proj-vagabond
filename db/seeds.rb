# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
City.destroy_all
Post.destroy_all
p "destroyed users, cities and posts"

p "creating users"
User.create ([{
  name: "Stella",
  avatar: "http://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12231654/Keeshond-MP.jpg",
  current_city: "San Francisco",
  email: "stella@ga.co",
  username: "stella",
  password: "stella"
},
{
  name: "Teako",
  avatar: "https://cdn.working-dog.net/static/images/race/33.jpg?v=4",
  current_city: "Boston",
  email: "teako@ga.co",
  username: "teakotime",
  password: "stella"
}])
p "creating cities"
City.create ([{
  name: "San Francisco",
  image: "app/assets/images/sf.png"
},
{
  name: "Boston",
  image: "app/assets/images/boston.png"
},
{
  name: "Gibraltar",
  image: "app/assets/images/gibraltar.png"
},
{
  name: "London",
  image: "app/assets/images/london.png"
}])
p "creating posts"
Post.create ([{
  title: "Trip 1",
  body: "Wicked pissah dolor sit amet, consectetur adipisicing elit. Hoodsie ornare nisi donatum vulputate jimmies sagittae vitae scrod. Elementum splendide you's guys, amet ovah heah tempor libris consectetur. Donec Fenway Park tristique pro kid id Glawstah. Complenti Cambridgeport natoque tincidunt. Dunkies sollicitudin tincidunt adipiscing tortor TD Gahden clicker elit aliquet. Id Southie vis bang a left Park Street consectetur. Dicant Red Line option, ipsum a donec. Fenway Park Slummerville Sox postea eget."
},
{
  title: "Trip 2",
  body: "Arnold Schwarzenegger overthrowing technology companies uber the resistance tourists Lyft venture capital? Free museums tech techie music Bay Bridge liberal media boho stand-up comedy! Yoga pants hypoallergenic dog the cloud fog Planned Parenthood food cart maternal heights.."
}])
Teako = User.create(name: "Teako")
Stella = User.create(name: "Stella")
Boston = City.create(name: "Boston")
trip_1 = Post.create(title: "Trip 1")

Teako.cities << Boston
Stella.cities << Boston
Boston.posts << trip_1
