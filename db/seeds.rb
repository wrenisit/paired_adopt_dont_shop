# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shelter_1 = Shelter.create( name:    "Denver Dog Shelter",
                            address: "123 Main St",
                            city:    "Denver",
                            state:   "CO",
                            zip:     "80206")
shelter_2 = Shelter.create( name:    "Denver Cat Shelter",
                            address: "123 Meow St",
                            city:    "Denver",
                            state:   "CO",
                            zip:     "80206")

dog_1 = shelter_1.pets.create( image: "https://www.washingtonpost.com/resizer/kPkFQsQjvSIjfXG-mFXDEpxq6-4=/767x0/smart/arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/HB4AT3D3IMI6TMPTWIZ74WAR54.jpg",
                  name: "Sparky",
                  approximate_age: 7,
                  description: "Sparky loves to play! His favorite game is No Take, Only Throw.",
                  sex: "male",
                  adoptable: true)

dog_2 = shelter_1.pets.create( image: "http://santansun.com/wp-content/uploads/2018/11/5b7fdeab1900001d035028dc.jpeg",
                  name: "Jerry",
                  approximate_age: 2,
                  description: "You're looking at your new best friend!",
                  sex: "male",
                  adoptable: true)

dog_3 = shelter_2.pets.create( image: "https://upload.wikimedia.org/wikipedia/commons/b/b5/Airedale_terrier_head%2C_Josselin_01.jpg",
                    name: "Louise",
                    approximate_age: 2,
                    description: "Louise loves people, places, and things.",
                    sex: "male",
                    adoptable: true)

dog_4 = shelter_2.pets.create( image: "https://petlandbradenton.com/wp-content/uploads/2018/02/1045420_800.jpg",
                    name: "Frank",
                    approximate_age: 1,
                    description: "Frank the tank - this chonk will be over 200 lbs when he is full grown.",
                    sex: "male",
                    adoptable: true)

shelter_review_1 = shelter_1.reviews.create(
                    title: "WOW! AWESOME SHELTER!",
                    rating: 5,
                    content: "I adopted my friendly pup from here! 10/10 would go back.",
                    opt_picture: "https://coxrare.files.wordpress.com/2018/07/human-empathy-dogs.png?w=1200&h=627&crop=1")

shelter_review_2 = shelter_1.reviews.create(
                    title: "Cleanest shelter I've been to!",
                    rating: 5,
                    content: "I adopted my friendly pups from here!",
                    opt_picture: "https://st2.depositphotos.com/4967775/11323/v/950/depositphotos_113235752-stock-illustration-avatar-girls-icon-vector-woman.jpg" )
